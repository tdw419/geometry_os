; DESCRIPTION: Composite: Places a yellow line segment connecting (290, 240) to (150, 79) then Renders a red disk with center (485, 214) and radius 18.
; PLAN: r0=290(x1), r1=240(y1), r2=150(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=485(x), r6=214(y), r7=18(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 290
LDI r1, 240
LDI r2, 150
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 214
LDI r7, 18
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
