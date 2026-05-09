; DESCRIPTION: Places a cyan line segment connecting (399, 42) to (282, 21).
; PLAN: r0=399(x1), r1=42(y1), r2=282(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 42
LDI r2, 282
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
