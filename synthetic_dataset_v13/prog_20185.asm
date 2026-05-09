; DESCRIPTION: Renders a cyan line between points (320, 61) and (324, 22).
; PLAN: r0=320(x1), r1=61(y1), r2=324(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 61
LDI r2, 324
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
