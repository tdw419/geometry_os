; DESCRIPTION: Renders a cyan line between points (366, 160) and (372, 197).
; PLAN: r0=366(x1), r1=160(y1), r2=372(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 160
LDI r2, 372
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
