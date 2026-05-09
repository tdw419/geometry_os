; DESCRIPTION: Draws a cyan line from (249, 15) to (170, 98).
; PLAN: r0=249(x1), r1=15(y1), r2=170(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 15
LDI r2, 170
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
