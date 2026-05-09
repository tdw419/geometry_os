; DESCRIPTION: Composite: Renders a blue disk with center (207, 171) and radius 36 then Renders a purple box of size 25x46 starting at (192, 75).
; PLAN: r0=207(x), r1=171(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=75(y), r7=25(width), r8=46(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 207
LDI r1, 171
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 75
LDI r7, 25
LDI r8, 46
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
