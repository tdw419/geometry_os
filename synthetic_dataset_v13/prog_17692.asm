; DESCRIPTION: Draws a orange line from (412, 173) to (243, 172).
; PLAN: r0=412(x1), r1=173(y1), r2=243(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 173
LDI r2, 243
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
