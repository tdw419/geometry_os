; DESCRIPTION: Draws a cyan line from (2, 37) to (64, 122).
; PLAN: r0=2(x1), r1=37(y1), r2=64(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 37
LDI r2, 64
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
