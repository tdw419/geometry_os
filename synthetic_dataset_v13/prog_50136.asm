; DESCRIPTION: Draws a black line from (195, 220) to (246, 228).
; PLAN: r0=195(x1), r1=220(y1), r2=246(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 220
LDI r2, 246
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
