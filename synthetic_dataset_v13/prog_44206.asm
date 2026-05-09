; DESCRIPTION: Draws a black line from (320, 255) to (401, 110).
; PLAN: r0=320(x1), r1=255(y1), r2=401(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 255
LDI r2, 401
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
