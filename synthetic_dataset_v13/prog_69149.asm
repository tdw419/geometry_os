; DESCRIPTION: Draws a blue line from (209, 53) to (263, 128).
; PLAN: r0=209(x1), r1=53(y1), r2=263(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 53
LDI r2, 263
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
