; DESCRIPTION: Draws a cyan line from (178, 132) to (160, 62).
; PLAN: r0=178(x1), r1=132(y1), r2=160(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 132
LDI r2, 160
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
