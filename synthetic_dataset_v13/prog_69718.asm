; DESCRIPTION: Draws a white line from (82, 56) to (144, 253).
; PLAN: r0=82(x1), r1=56(y1), r2=144(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 56
LDI r2, 144
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
