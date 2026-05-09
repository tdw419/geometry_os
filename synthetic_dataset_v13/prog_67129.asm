; DESCRIPTION: Places a cyan line segment connecting (345, 42) to (341, 28).
; PLAN: r0=345(x1), r1=42(y1), r2=341(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 42
LDI r2, 341
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
