; DESCRIPTION: Draws a red line from (333, 186) to (511, 86).
; PLAN: r0=333(x1), r1=186(y1), r2=511(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 186
LDI r2, 511
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
