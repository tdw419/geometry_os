; DESCRIPTION: Composite: Places a green circle of radius 71 at center (136, 127) then Renders a purple box of size 105x70 starting at (25, 172).
; PLAN: r0=136(x), r1=127(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x), r6=172(y), r7=105(width), r8=70(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 136
LDI r1, 127
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 172
LDI r7, 105
LDI r8, 70
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
