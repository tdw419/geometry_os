; DESCRIPTION: Composite: Renders a blue line between points (340, 174) and (284, 81) then Places a green circle of radius 20 at center (327, 234).
; PLAN: r0=340(x1), r1=174(y1), r2=284(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=234(y), r7=20(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 340
LDI r1, 174
LDI r2, 284
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 234
LDI r7, 20
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
