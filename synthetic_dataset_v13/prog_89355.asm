; DESCRIPTION: Composite: Places a purple line segment connecting (86, 239) to (306, 204) then Renders a magenta disk with center (333, 138) and radius 78.
; PLAN: r0=86(x1), r1=239(y1), r2=306(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=138(y), r7=78(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 86
LDI r1, 239
LDI r2, 306
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 138
LDI r7, 78
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
