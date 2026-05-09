; DESCRIPTION: Composite: Renders a purple disk with center (286, 128) and radius 45 then Renders a yellow line between points (502, 217) and (488, 220).
; PLAN: r0=286(x), r1=128(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=502(x1), r6=217(y1), r7=488(x2), r8=220(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 286
LDI r1, 128
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 502
LDI r6, 217
LDI r7, 488
LDI r8, 220
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
