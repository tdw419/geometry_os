; DESCRIPTION: Draws a cyan line from (84, 17) to (393, 64).
; PLAN: r0=84(x1), r1=17(y1), r2=393(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 17
LDI r2, 393
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
