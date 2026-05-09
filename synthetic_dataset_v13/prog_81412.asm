; DESCRIPTION: Composite: Renders a blue disk with center (313, 178) and radius 76 then Renders a orange line between points (130, 244) and (38, 95).
; PLAN: r0=313(x), r1=178(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x1), r6=244(y1), r7=38(x2), r8=95(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 178
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 244
LDI r7, 38
LDI r8, 95
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
