; DESCRIPTION: Renders a cyan line between points (134, 3) and (196, 155).
; PLAN: r0=134(x1), r1=3(y1), r2=196(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 3
LDI r2, 196
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
