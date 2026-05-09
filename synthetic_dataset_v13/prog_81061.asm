; DESCRIPTION: Renders a cyan line between points (122, 53) and (366, 40).
; PLAN: r0=122(x1), r1=53(y1), r2=366(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 53
LDI r2, 366
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
