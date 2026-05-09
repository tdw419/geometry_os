; DESCRIPTION: Renders a cyan line between points (41, 205) and (489, 222).
; PLAN: r0=41(x1), r1=205(y1), r2=489(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 205
LDI r2, 489
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
