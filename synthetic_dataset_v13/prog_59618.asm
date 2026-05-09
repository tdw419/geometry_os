; DESCRIPTION: Draws a green line from (416, 37) to (244, 178).
; PLAN: r0=416(x1), r1=37(y1), r2=244(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 37
LDI r2, 244
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
