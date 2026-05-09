; DESCRIPTION: Renders a yellow line between points (447, 180) and (48, 187).
; PLAN: r0=447(x1), r1=180(y1), r2=48(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 180
LDI r2, 48
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
