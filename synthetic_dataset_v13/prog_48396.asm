; DESCRIPTION: Renders a cyan line between points (329, 174) and (43, 176).
; PLAN: r0=329(x1), r1=174(y1), r2=43(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 174
LDI r2, 43
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
