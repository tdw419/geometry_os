; DESCRIPTION: Renders a yellow line between points (320, 239) and (149, 138).
; PLAN: r0=320(x1), r1=239(y1), r2=149(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 239
LDI r2, 149
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
