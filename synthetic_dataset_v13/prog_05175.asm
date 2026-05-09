; DESCRIPTION: Draws a cyan line from (86, 115) to (366, 32).
; PLAN: r0=86(x1), r1=115(y1), r2=366(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 115
LDI r2, 366
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
