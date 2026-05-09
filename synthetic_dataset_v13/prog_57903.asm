; DESCRIPTION: Draws a cyan line from (120, 105) to (141, 23).
; PLAN: r0=120(x1), r1=105(y1), r2=141(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 105
LDI r2, 141
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
