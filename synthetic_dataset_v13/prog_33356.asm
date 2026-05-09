; DESCRIPTION: Renders a cyan line between points (329, 91) and (405, 252).
; PLAN: r0=329(x1), r1=91(y1), r2=405(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 91
LDI r2, 405
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
