; DESCRIPTION: Composite: Renders a purple disk with center (462, 125) and radius 26 then Places a orange line segment connecting (64, 130) to (72, 27).
; PLAN: r0=462(x), r1=125(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=64(x1), r6=130(y1), r7=72(x2), r8=27(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 125
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 64
LDI r6, 130
LDI r7, 72
LDI r8, 27
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
