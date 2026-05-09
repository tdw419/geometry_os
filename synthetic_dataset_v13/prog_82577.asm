; DESCRIPTION: Draws a cyan line from (306, 140) to (161, 9).
; PLAN: r0=306(x1), r1=140(y1), r2=161(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 140
LDI r2, 161
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
