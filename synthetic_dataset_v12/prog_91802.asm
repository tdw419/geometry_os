; DESCRIPTION: Draws a black line from (262, 255) to (368, 130).
; PLAN: r0=262(x1), r1=255(y1), r2=368(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 255
LDI r2, 368
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
