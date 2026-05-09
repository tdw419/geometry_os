; DESCRIPTION: Renders a green line between points (366, 42) and (96, 121).
; PLAN: r0=366(x1), r1=42(y1), r2=96(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 42
LDI r2, 96
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
