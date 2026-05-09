; DESCRIPTION: Draws a black line from (127, 209) to (268, 30).
; PLAN: r0=127(x1), r1=209(y1), r2=268(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 209
LDI r2, 268
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
