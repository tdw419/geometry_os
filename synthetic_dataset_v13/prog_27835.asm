; DESCRIPTION: Draws a green line from (394, 68) to (453, 226).
; PLAN: r0=394(x1), r1=68(y1), r2=453(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 68
LDI r2, 453
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
