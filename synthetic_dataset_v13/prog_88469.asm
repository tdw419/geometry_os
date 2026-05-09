; DESCRIPTION: Draws a cyan line from (127, 63) to (222, 31).
; PLAN: r0=127(x1), r1=63(y1), r2=222(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 63
LDI r2, 222
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
