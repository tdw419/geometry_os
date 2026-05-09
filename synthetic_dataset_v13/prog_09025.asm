; DESCRIPTION: Renders a cyan line between points (162, 170) and (429, 42).
; PLAN: r0=162(x1), r1=170(y1), r2=429(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 170
LDI r2, 429
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
