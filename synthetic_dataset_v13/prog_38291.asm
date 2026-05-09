; DESCRIPTION: Draws a white line from (182, 54) to (485, 224).
; PLAN: r0=182(x1), r1=54(y1), r2=485(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 54
LDI r2, 485
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
