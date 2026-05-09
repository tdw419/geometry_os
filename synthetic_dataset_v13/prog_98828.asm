; DESCRIPTION: Draws a cyan line from (256, 222) to (115, 157).
; PLAN: r0=256(x1), r1=222(y1), r2=115(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 222
LDI r2, 115
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
