; DESCRIPTION: Draws a white line from (330, 166) to (129, 67).
; PLAN: r0=330(x1), r1=166(y1), r2=129(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 166
LDI r2, 129
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
