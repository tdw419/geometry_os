; DESCRIPTION: Places a cyan line segment connecting (394, 112) to (324, 48).
; PLAN: r0=394(x1), r1=112(y1), r2=324(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 112
LDI r2, 324
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
