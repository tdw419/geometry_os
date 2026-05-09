; DESCRIPTION: Renders a white line between points (346, 216) and (33, 68).
; PLAN: r0=346(x1), r1=216(y1), r2=33(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 216
LDI r2, 33
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
