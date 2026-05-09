; DESCRIPTION: Draws a blue line from (255, 72) to (27, 128).
; PLAN: r0=255(x1), r1=72(y1), r2=27(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 72
LDI r2, 27
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
