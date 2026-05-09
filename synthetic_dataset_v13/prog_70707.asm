; DESCRIPTION: Draws a yellow line from (320, 174) to (460, 28).
; PLAN: r0=320(x1), r1=174(y1), r2=460(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 174
LDI r2, 460
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
