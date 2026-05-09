; DESCRIPTION: Draws a white line from (304, 25) to (213, 92).
; PLAN: r0=304(x1), r1=25(y1), r2=213(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 25
LDI r2, 213
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
