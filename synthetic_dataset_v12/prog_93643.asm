; DESCRIPTION: Draws a black line from (137, 126) to (113, 48).
; PLAN: r0=137(x1), r1=126(y1), r2=113(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 126
LDI r2, 113
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
