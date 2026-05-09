; DESCRIPTION: Draws a cyan line from (327, 89) to (114, 46).
; PLAN: r0=327(x1), r1=89(y1), r2=114(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 89
LDI r2, 114
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
