; DESCRIPTION: Draws a black line from (255, 116) to (496, 134).
; PLAN: r0=255(x1), r1=116(y1), r2=496(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 116
LDI r2, 496
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
