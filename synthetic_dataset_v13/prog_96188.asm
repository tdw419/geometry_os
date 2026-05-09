; DESCRIPTION: Draws a white line from (401, 66) to (182, 9).
; PLAN: r0=401(x1), r1=66(y1), r2=182(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 66
LDI r2, 182
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
