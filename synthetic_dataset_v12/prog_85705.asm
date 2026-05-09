; DESCRIPTION: Draws a white line from (401, 236) to (366, 88).
; PLAN: r0=401(x1), r1=236(y1), r2=366(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 236
LDI r2, 366
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
