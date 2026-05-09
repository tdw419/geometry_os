; DESCRIPTION: Renders a cyan line between points (101, 187) and (19, 219).
; PLAN: r0=101(x1), r1=187(y1), r2=19(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 187
LDI r2, 19
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
