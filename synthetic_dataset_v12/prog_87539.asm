; DESCRIPTION: Draws a cyan line from (481, 85) to (381, 0).
; PLAN: r0=481(x1), r1=85(y1), r2=381(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 85
LDI r2, 381
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
