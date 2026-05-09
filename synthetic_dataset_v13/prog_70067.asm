; DESCRIPTION: Draws a orange line from (208, 173) to (67, 214).
; PLAN: r0=208(x1), r1=173(y1), r2=67(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 173
LDI r2, 67
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
