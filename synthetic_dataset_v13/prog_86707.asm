; DESCRIPTION: Draws a yellow line from (175, 21) to (398, 10).
; PLAN: r0=175(x1), r1=21(y1), r2=398(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 21
LDI r2, 398
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
