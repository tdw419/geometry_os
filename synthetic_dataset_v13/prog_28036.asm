; DESCRIPTION: Draws a white line from (67, 254) to (204, 255).
; PLAN: r0=67(x1), r1=254(y1), r2=204(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 254
LDI r2, 204
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
