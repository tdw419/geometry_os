; DESCRIPTION: Renders a white line between points (204, 255) and (428, 59).
; PLAN: r0=204(x1), r1=255(y1), r2=428(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 255
LDI r2, 428
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
