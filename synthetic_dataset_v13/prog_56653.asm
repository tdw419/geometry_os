; DESCRIPTION: Draws a green line from (510, 222) to (23, 94).
; PLAN: r0=510(x1), r1=222(y1), r2=23(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 222
LDI r2, 23
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
