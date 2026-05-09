; DESCRIPTION: Renders a cyan line between points (253, 56) and (229, 103).
; PLAN: r0=253(x1), r1=56(y1), r2=229(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 56
LDI r2, 229
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
