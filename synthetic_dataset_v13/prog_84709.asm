; DESCRIPTION: Draws a purple line from (198, 39) to (209, 126).
; PLAN: r0=198(x1), r1=39(y1), r2=209(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 39
LDI r2, 209
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
