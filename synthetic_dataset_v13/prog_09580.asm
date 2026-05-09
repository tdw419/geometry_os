; DESCRIPTION: Draws a cyan line from (387, 137) to (261, 118).
; PLAN: r0=387(x1), r1=137(y1), r2=261(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 137
LDI r2, 261
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
