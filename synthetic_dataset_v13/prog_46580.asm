; DESCRIPTION: Draws a cyan line from (429, 6) to (481, 88).
; PLAN: r0=429(x1), r1=6(y1), r2=481(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 6
LDI r2, 481
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
