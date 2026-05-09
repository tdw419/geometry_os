; DESCRIPTION: Renders a green line between points (458, 91) and (218, 173).
; PLAN: r0=458(x1), r1=91(y1), r2=218(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 91
LDI r2, 218
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
