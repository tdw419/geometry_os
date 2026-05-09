; DESCRIPTION: Places a cyan line segment connecting (86, 214) to (442, 156).
; PLAN: r0=86(x1), r1=214(y1), r2=442(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 214
LDI r2, 442
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
