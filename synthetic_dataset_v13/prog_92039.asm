; DESCRIPTION: Renders a green line between points (457, 64) and (275, 206).
; PLAN: r0=457(x1), r1=64(y1), r2=275(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 64
LDI r2, 275
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
