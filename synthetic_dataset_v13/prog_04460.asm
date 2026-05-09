; DESCRIPTION: Composite: Places a cyan dot at position (21, 106) then Places a magenta 55x68 rectangle at position (203, 68).
; PLAN: r0=21(x), r1=106(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=203(x), r6=68(y), r7=55(width), r8=68(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 21
LDI r1, 106
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 203
LDI r6, 68
LDI r7, 55
LDI r8, 68
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
