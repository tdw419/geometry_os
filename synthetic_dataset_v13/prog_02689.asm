; DESCRIPTION: Renders a cyan line between points (102, 66) and (437, 206).
; PLAN: r0=102(x1), r1=66(y1), r2=437(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 66
LDI r2, 437
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
