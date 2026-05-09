; DESCRIPTION: Draws a white line from (216, 154) to (269, 31).
; PLAN: r0=216(x1), r1=154(y1), r2=269(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 154
LDI r2, 269
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
