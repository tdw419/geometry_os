; DESCRIPTION: Draws a cyan line from (475, 91) to (339, 168).
; PLAN: r0=475(x1), r1=91(y1), r2=339(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 91
LDI r2, 339
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
