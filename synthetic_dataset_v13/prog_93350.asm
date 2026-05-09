; DESCRIPTION: Draws a white line from (154, 204) to (111, 15).
; PLAN: r0=154(x1), r1=204(y1), r2=111(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 204
LDI r2, 111
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
