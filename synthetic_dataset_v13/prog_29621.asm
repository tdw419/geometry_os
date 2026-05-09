; DESCRIPTION: Renders a white line between points (130, 67) and (301, 209).
; PLAN: r0=130(x1), r1=67(y1), r2=301(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 67
LDI r2, 301
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
