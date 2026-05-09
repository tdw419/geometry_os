; DESCRIPTION: Draws a purple line from (24, 239) to (406, 215).
; PLAN: r0=24(x1), r1=239(y1), r2=406(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 239
LDI r2, 406
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
