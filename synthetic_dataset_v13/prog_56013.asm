; DESCRIPTION: Renders a cyan line between points (319, 56) and (320, 6).
; PLAN: r0=319(x1), r1=56(y1), r2=320(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 56
LDI r2, 320
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
