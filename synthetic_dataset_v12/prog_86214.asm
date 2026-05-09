; DESCRIPTION: Renders a green line between points (398, 117) and (203, 193).
; PLAN: r0=398(x1), r1=117(y1), r2=203(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 117
LDI r2, 203
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
