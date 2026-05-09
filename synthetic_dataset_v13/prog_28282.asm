; DESCRIPTION: Composite: Renders a purple disk with center (334, 221) and radius 19 then Renders a yellow line between points (152, 113) and (502, 70).
; PLAN: r0=334(x), r1=221(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x1), r6=113(y1), r7=502(x2), r8=70(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 221
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 113
LDI r7, 502
LDI r8, 70
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
