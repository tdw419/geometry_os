; DESCRIPTION: Draws a red line from (276, 231) to (218, 220).
; PLAN: r0=276(x1), r1=231(y1), r2=218(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 231
LDI r2, 218
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
