; DESCRIPTION: Draws a cyan line from (270, 162) to (384, 219).
; PLAN: r0=270(x1), r1=162(y1), r2=384(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 162
LDI r2, 384
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
