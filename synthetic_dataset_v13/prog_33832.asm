; DESCRIPTION: Places a cyan line segment connecting (55, 126) to (285, 12).
; PLAN: r0=55(x1), r1=126(y1), r2=285(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 126
LDI r2, 285
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
