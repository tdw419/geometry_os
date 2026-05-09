; DESCRIPTION: Draws a white line from (206, 128) to (182, 69).
; PLAN: r0=206(x1), r1=128(y1), r2=182(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 128
LDI r2, 182
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
