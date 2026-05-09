; DESCRIPTION: Draws a white line from (27, 148) to (26, 255).
; PLAN: r0=27(x1), r1=148(y1), r2=26(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 148
LDI r2, 26
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
