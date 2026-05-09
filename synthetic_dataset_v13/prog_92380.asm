; DESCRIPTION: Composite: Creates a blue circular shape at (118, 193) with radius 51 then Renders a green line between points (488, 146) and (320, 142).
; PLAN: r0=118(x), r1=193(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=488(x1), r6=146(y1), r7=320(x2), r8=142(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 118
LDI r1, 193
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 488
LDI r6, 146
LDI r7, 320
LDI r8, 142
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
