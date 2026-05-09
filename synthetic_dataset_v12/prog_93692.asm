; DESCRIPTION: Renders a black line between points (152, 245) and (127, 68).
; PLAN: r0=152(x1), r1=245(y1), r2=127(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 245
LDI r2, 127
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
