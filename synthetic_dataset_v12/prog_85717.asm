; DESCRIPTION: Places a red line segment connecting (421, 42) to (394, 51).
; PLAN: r0=421(x1), r1=42(y1), r2=394(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 42
LDI r2, 394
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
