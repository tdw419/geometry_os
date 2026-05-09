; DESCRIPTION: Composite: Places a blue dot at position (100, 100) then Places a yellow 24x79 rectangle at position (191, 158).
; PLAN: r0=100(x), r1=100(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=191(x), r6=158(y), r7=24(width), r8=79(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 100
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 191
LDI r6, 158
LDI r7, 24
LDI r8, 79
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
