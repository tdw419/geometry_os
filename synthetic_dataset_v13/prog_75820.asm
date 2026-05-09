; DESCRIPTION: Renders a green line between points (294, 30) and (266, 25).
; PLAN: r0=294(x1), r1=30(y1), r2=266(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 30
LDI r2, 266
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
