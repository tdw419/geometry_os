; DESCRIPTION: Renders a white line between points (128, 196) and (65, 229).
; PLAN: r0=128(x1), r1=196(y1), r2=65(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 196
LDI r2, 65
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
