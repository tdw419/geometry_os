; DESCRIPTION: Renders a yellow line between points (31, 242) and (320, 223).
; PLAN: r0=31(x1), r1=242(y1), r2=320(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 242
LDI r2, 320
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
