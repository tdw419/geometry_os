; DESCRIPTION: Draws a black line from (286, 111) to (126, 128).
; PLAN: r0=286(x1), r1=111(y1), r2=126(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 111
LDI r2, 126
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
