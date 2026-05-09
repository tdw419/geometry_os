; DESCRIPTION: Renders a cyan line between points (37, 91) and (353, 50).
; PLAN: r0=37(x1), r1=91(y1), r2=353(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 91
LDI r2, 353
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
