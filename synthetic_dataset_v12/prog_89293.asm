; DESCRIPTION: Draws a yellow line from (433, 209) to (90, 32).
; PLAN: r0=433(x1), r1=209(y1), r2=90(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 209
LDI r2, 90
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
