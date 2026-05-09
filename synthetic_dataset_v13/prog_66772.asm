; DESCRIPTION: Composite: Places a red dot at position (323, 156) then Places a blue 108x100 rectangle at position (44, 133).
; PLAN: r0=323(x), r1=156(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=44(x), r6=133(y), r7=108(width), r8=100(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 156
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 44
LDI r6, 133
LDI r7, 108
LDI r8, 100
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
