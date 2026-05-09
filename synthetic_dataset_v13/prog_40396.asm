; DESCRIPTION: Draws a purple line from (387, 244) to (248, 154).
; PLAN: r0=387(x1), r1=244(y1), r2=248(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 244
LDI r2, 248
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
