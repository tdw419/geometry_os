; DESCRIPTION: Places a cyan line segment connecting (340, 101) to (63, 193).
; PLAN: r0=340(x1), r1=101(y1), r2=63(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 101
LDI r2, 63
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
