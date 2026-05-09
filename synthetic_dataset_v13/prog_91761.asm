; DESCRIPTION: Draws a green line from (244, 154) to (416, 64).
; PLAN: r0=244(x1), r1=154(y1), r2=416(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 154
LDI r2, 416
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
