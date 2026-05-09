; DESCRIPTION: Draws a cyan line from (221, 230) to (229, 77).
; PLAN: r0=221(x1), r1=230(y1), r2=229(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 230
LDI r2, 229
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
