; DESCRIPTION: Renders a cyan line between points (320, 226) and (155, 40).
; PLAN: r0=320(x1), r1=226(y1), r2=155(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 226
LDI r2, 155
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
