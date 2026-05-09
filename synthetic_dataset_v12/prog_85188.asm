; DESCRIPTION: Draws a cyan line from (389, 30) to (117, 198).
; PLAN: r0=389(x1), r1=30(y1), r2=117(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 30
LDI r2, 117
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
