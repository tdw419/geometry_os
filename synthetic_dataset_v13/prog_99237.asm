; DESCRIPTION: Renders a red line between points (258, 39) and (320, 28).
; PLAN: r0=258(x1), r1=39(y1), r2=320(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 39
LDI r2, 320
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
