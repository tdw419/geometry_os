; DESCRIPTION: Draws a cyan line from (469, 231) to (182, 79).
; PLAN: r0=469(x1), r1=231(y1), r2=182(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 231
LDI r2, 182
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
