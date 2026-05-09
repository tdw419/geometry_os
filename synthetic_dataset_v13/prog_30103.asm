; DESCRIPTION: Composite: Places a yellow line segment connecting (166, 240) to (198, 7) then Renders a red disk with center (485, 215) and radius 16.
; PLAN: r0=166(x1), r1=240(y1), r2=198(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=485(x), r6=215(y), r7=16(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 166
LDI r1, 240
LDI r2, 198
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 215
LDI r7, 16
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
