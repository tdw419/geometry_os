; DESCRIPTION: Draws a green line from (331, 52) to (263, 255).
; PLAN: r0=331(x1), r1=52(y1), r2=263(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 52
LDI r2, 263
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
