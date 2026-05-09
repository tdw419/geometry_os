; DESCRIPTION: Draws a white line from (305, 231) to (107, 79).
; PLAN: r0=305(x1), r1=231(y1), r2=107(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 231
LDI r2, 107
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
