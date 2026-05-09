; DESCRIPTION: Draws a green line from (263, 19) to (472, 215).
; PLAN: r0=263(x1), r1=19(y1), r2=472(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 19
LDI r2, 472
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
