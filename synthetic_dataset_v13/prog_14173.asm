; DESCRIPTION: Renders a red line between points (307, 41) and (499, 86).
; PLAN: r0=307(x1), r1=41(y1), r2=499(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 41
LDI r2, 499
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
