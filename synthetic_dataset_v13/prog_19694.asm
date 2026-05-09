; DESCRIPTION: Renders a red line between points (197, 175) and (320, 76).
; PLAN: r0=197(x1), r1=175(y1), r2=320(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 175
LDI r2, 320
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
