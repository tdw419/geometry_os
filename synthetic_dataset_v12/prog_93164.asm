; DESCRIPTION: Draws a white line from (296, 1) to (305, 62).
; PLAN: r0=296(x1), r1=1(y1), r2=305(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 1
LDI r2, 305
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
