; DESCRIPTION: Places a cyan line segment connecting (394, 93) to (341, 84).
; PLAN: r0=394(x1), r1=93(y1), r2=341(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 93
LDI r2, 341
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
