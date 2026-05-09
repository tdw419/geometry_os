; DESCRIPTION: Draws a white line from (364, 168) to (249, 142).
; PLAN: r0=364(x1), r1=168(y1), r2=249(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 168
LDI r2, 249
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
