; DESCRIPTION: Draws a white line from (268, 194) to (416, 225).
; PLAN: r0=268(x1), r1=194(y1), r2=416(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 194
LDI r2, 416
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
