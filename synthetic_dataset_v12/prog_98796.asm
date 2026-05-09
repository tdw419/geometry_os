; DESCRIPTION: Composite: Places a green dot at position (264, 110) then Renders a purple box of size 26x44 starting at (306, 206).
; PLAN: r0=264(x), r1=110(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=306(x), r6=206(y), r7=26(width), r8=44(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 110
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 306
LDI r6, 206
LDI r7, 26
LDI r8, 44
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
