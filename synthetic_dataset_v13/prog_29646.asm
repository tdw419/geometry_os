; DESCRIPTION: Renders a yellow line between points (384, 180) and (419, 214).
; PLAN: r0=384(x1), r1=180(y1), r2=419(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 180
LDI r2, 419
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
