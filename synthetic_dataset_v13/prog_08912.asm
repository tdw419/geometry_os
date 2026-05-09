; DESCRIPTION: Places a blue line segment connecting (394, 108) to (443, 86).
; PLAN: r0=394(x1), r1=108(y1), r2=443(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 108
LDI r2, 443
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
