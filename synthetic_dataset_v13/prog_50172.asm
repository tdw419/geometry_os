; DESCRIPTION: Renders a cyan line between points (348, 42) and (428, 181).
; PLAN: r0=348(x1), r1=42(y1), r2=428(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 42
LDI r2, 428
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
