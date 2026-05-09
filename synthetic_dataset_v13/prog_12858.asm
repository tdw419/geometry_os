; DESCRIPTION: Renders a white line between points (214, 219) and (507, 165).
; PLAN: r0=214(x1), r1=219(y1), r2=507(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 219
LDI r2, 507
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
