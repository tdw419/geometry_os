; DESCRIPTION: Renders a cyan line between points (219, 122) and (366, 237).
; PLAN: r0=219(x1), r1=122(y1), r2=366(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 122
LDI r2, 366
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
