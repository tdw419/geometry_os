; DESCRIPTION: Draws a red line from (256, 135) to (160, 65).
; PLAN: r0=256(x1), r1=135(y1), r2=160(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 135
LDI r2, 160
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
