; DESCRIPTION: Draws a cyan line from (149, 247) to (442, 244).
; PLAN: r0=149(x1), r1=247(y1), r2=442(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 247
LDI r2, 442
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
