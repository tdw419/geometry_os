; DESCRIPTION: Draws a black line from (309, 120) to (424, 154).
; PLAN: r0=309(x1), r1=120(y1), r2=424(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 120
LDI r2, 424
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
