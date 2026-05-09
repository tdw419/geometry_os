; DESCRIPTION: Renders a cyan line between points (147, 144) and (506, 215).
; PLAN: r0=147(x1), r1=144(y1), r2=506(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 144
LDI r2, 506
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
