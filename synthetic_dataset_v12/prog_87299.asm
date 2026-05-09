; DESCRIPTION: Draws a cyan line from (427, 70) to (35, 160).
; PLAN: r0=427(x1), r1=70(y1), r2=35(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 70
LDI r2, 35
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
