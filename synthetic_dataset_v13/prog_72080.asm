; DESCRIPTION: Draws a green line from (156, 248) to (127, 253).
; PLAN: r0=156(x1), r1=248(y1), r2=127(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 248
LDI r2, 127
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
