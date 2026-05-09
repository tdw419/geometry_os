; DESCRIPTION: Composite: Renders a orange disk with center (284, 91) and radius 60 then Renders a blue line between points (330, 229) and (21, 101).
; PLAN: r0=284(x), r1=91(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=330(x1), r6=229(y1), r7=21(x2), r8=101(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 91
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 330
LDI r6, 229
LDI r7, 21
LDI r8, 101
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
