; DESCRIPTION: Draws a green line from (320, 11) to (135, 182).
; PLAN: r0=320(x1), r1=11(y1), r2=135(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 11
LDI r2, 135
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
