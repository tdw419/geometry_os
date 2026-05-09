; DESCRIPTION: Draws a cyan line from (295, 133) to (377, 157).
; PLAN: r0=295(x1), r1=133(y1), r2=377(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 133
LDI r2, 377
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
