; DESCRIPTION: Renders a yellow line between points (503, 95) and (384, 125).
; PLAN: r0=503(x1), r1=95(y1), r2=384(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 95
LDI r2, 384
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
