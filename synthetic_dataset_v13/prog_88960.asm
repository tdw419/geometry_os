; DESCRIPTION: Draws a cyan line from (438, 161) to (202, 114).
; PLAN: r0=438(x1), r1=161(y1), r2=202(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 161
LDI r2, 202
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
