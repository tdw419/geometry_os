; DESCRIPTION: Places a orange line segment connecting (294, 222) to (510, 107).
; PLAN: r0=294(x1), r1=222(y1), r2=510(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 222
LDI r2, 510
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
