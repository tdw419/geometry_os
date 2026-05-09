; DESCRIPTION: Draws a purple line from (340, 209) to (254, 27).
; PLAN: r0=340(x1), r1=209(y1), r2=254(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 209
LDI r2, 254
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
