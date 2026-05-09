; DESCRIPTION: Draws a orange line from (152, 124) to (224, 173).
; PLAN: r0=152(x1), r1=124(y1), r2=224(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 124
LDI r2, 224
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
