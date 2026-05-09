; DESCRIPTION: Renders a red line between points (218, 43) and (412, 244).
; PLAN: r0=218(x1), r1=43(y1), r2=412(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 43
LDI r2, 412
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
