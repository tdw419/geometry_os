; DESCRIPTION: Draws a yellow line from (126, 254) to (19, 239).
; PLAN: r0=126(x1), r1=254(y1), r2=19(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 254
LDI r2, 19
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
