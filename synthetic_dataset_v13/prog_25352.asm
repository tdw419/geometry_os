; DESCRIPTION: Renders a green line between points (362, 205) and (275, 41).
; PLAN: r0=362(x1), r1=205(y1), r2=275(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 205
LDI r2, 275
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
