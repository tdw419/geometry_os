; DESCRIPTION: Places a cyan line segment connecting (10, 76) to (446, 65).
; PLAN: r0=10(x1), r1=76(y1), r2=446(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 76
LDI r2, 446
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
