; DESCRIPTION: Renders a cyan line between points (351, 198) and (294, 40).
; PLAN: r0=351(x1), r1=198(y1), r2=294(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 198
LDI r2, 294
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
