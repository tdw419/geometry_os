; DESCRIPTION: Draws a cyan line from (407, 105) to (24, 187).
; PLAN: r0=407(x1), r1=105(y1), r2=24(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 105
LDI r2, 24
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
