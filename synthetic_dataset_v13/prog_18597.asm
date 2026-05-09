; DESCRIPTION: Renders a cyan line between points (439, 234) and (176, 96).
; PLAN: r0=439(x1), r1=234(y1), r2=176(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 234
LDI r2, 176
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
