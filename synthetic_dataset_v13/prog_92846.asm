; DESCRIPTION: Renders a black line between points (327, 60) and (261, 48).
; PLAN: r0=327(x1), r1=60(y1), r2=261(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 60
LDI r2, 261
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
