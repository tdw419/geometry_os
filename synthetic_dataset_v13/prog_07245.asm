; DESCRIPTION: Composite: Renders a yellow disk with center (367, 200) and radius 10 then Places a magenta line segment connecting (18, 17) to (130, 41).
; PLAN: r0=367(x), r1=200(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=18(x1), r6=17(y1), r7=130(x2), r8=41(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 200
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 18
LDI r6, 17
LDI r7, 130
LDI r8, 41
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
