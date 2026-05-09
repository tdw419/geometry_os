; DESCRIPTION: Draws a green line from (10, 173) to (283, 107).
; PLAN: r0=10(x1), r1=173(y1), r2=283(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 173
LDI r2, 283
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
