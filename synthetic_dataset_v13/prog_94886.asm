; DESCRIPTION: Draws a red line from (9, 129) to (340, 128).
; PLAN: r0=9(x1), r1=129(y1), r2=340(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 129
LDI r2, 340
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
