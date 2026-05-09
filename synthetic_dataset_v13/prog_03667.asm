; DESCRIPTION: Draws a white line from (379, 68) to (406, 226).
; PLAN: r0=379(x1), r1=68(y1), r2=406(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 68
LDI r2, 406
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
