; DESCRIPTION: Composite: Creates a yellow circular shape at (159, 239) with radius 10 then Renders a blue line between points (171, 113) and (374, 197).
; PLAN: r0=159(x), r1=239(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=171(x1), r6=113(y1), r7=374(x2), r8=197(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 239
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 171
LDI r6, 113
LDI r7, 374
LDI r8, 197
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
