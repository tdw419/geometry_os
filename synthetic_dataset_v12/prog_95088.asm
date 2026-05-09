; DESCRIPTION: Draws a cyan line from (500, 142) to (442, 62).
; PLAN: r0=500(x1), r1=142(y1), r2=442(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 142
LDI r2, 442
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
