; DESCRIPTION: Composite: Places a purple dot at position (203, 80) then Renders a blue box of size 66x33 starting at (60, 4).
; PLAN: r0=203(x), r1=80(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=4(y), r7=66(width), r8=33(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 80
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 60
LDI r6, 4
LDI r7, 66
LDI r8, 33
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
