; DESCRIPTION: Composite: Renders a blue disk with center (128, 215) and radius 35 then Places a green line segment connecting (412, 99) to (215, 178).
; PLAN: r0=128(x), r1=215(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=412(x1), r6=99(y1), r7=215(x2), r8=178(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 215
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 412
LDI r6, 99
LDI r7, 215
LDI r8, 178
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
