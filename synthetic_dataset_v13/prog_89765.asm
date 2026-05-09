; DESCRIPTION: Renders a cyan line between points (272, 66) and (320, 40).
; PLAN: r0=272(x1), r1=66(y1), r2=320(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 66
LDI r2, 320
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
