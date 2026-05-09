; DESCRIPTION: Composite: Renders a green disk with center (409, 121) and radius 76 then Draws a red line from (238, 233) to (503, 159).
; PLAN: r0=409(x), r1=121(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=238(x1), r6=233(y1), r7=503(x2), r8=159(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 121
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 238
LDI r6, 233
LDI r7, 503
LDI r8, 159
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
