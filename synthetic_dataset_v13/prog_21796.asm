; DESCRIPTION: Draws a cyan line from (320, 240) to (282, 203).
; PLAN: r0=320(x1), r1=240(y1), r2=282(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 240
LDI r2, 282
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
