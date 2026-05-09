; DESCRIPTION: Renders a yellow line between points (64, 27) and (320, 107).
; PLAN: r0=64(x1), r1=27(y1), r2=320(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 27
LDI r2, 320
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
