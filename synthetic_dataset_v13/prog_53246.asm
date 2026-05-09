; DESCRIPTION: Draws a white line from (137, 245) to (304, 60).
; PLAN: r0=137(x1), r1=245(y1), r2=304(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 245
LDI r2, 304
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
