; DESCRIPTION: Draws a white line from (275, 121) to (384, 62).
; PLAN: r0=275(x1), r1=121(y1), r2=384(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 121
LDI r2, 384
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
