; DESCRIPTION: Draws a cyan line from (222, 15) to (56, 24).
; PLAN: r0=222(x1), r1=15(y1), r2=56(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 15
LDI r2, 56
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
