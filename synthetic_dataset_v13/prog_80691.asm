; DESCRIPTION: Draws a black line from (126, 63) to (295, 74).
; PLAN: r0=126(x1), r1=63(y1), r2=295(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 63
LDI r2, 295
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
