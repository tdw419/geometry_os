; DESCRIPTION: Draws a cyan line from (77, 252) to (127, 64).
; PLAN: r0=77(x1), r1=252(y1), r2=127(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 252
LDI r2, 127
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
