; DESCRIPTION: Draws a blue line from (126, 208) to (209, 206).
; PLAN: r0=126(x1), r1=208(y1), r2=209(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 208
LDI r2, 209
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
