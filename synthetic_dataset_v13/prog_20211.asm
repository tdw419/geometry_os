; DESCRIPTION: Draws a white line from (228, 100) to (401, 182).
; PLAN: r0=228(x1), r1=100(y1), r2=401(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 100
LDI r2, 401
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
