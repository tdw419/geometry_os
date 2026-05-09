; DESCRIPTION: Draws a green line from (385, 70) to (456, 128).
; PLAN: r0=385(x1), r1=70(y1), r2=456(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 70
LDI r2, 456
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
