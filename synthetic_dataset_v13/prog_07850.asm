; DESCRIPTION: Renders a cyan line between points (357, 227) and (333, 132).
; PLAN: r0=357(x1), r1=227(y1), r2=333(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 227
LDI r2, 333
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
