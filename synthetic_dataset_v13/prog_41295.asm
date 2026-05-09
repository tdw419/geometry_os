; DESCRIPTION: Draws a black line from (17, 39) to (320, 70).
; PLAN: r0=17(x1), r1=39(y1), r2=320(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 39
LDI r2, 320
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
