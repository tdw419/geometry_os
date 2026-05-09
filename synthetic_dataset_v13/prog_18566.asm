; DESCRIPTION: Renders a red line between points (50, 67) and (272, 70).
; PLAN: r0=50(x1), r1=67(y1), r2=272(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 67
LDI r2, 272
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
