; DESCRIPTION: Renders a cyan line between points (273, 205) and (27, 189).
; PLAN: r0=273(x1), r1=205(y1), r2=27(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 205
LDI r2, 27
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
