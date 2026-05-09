; DESCRIPTION: Draws a cyan line from (256, 192) to (270, 243).
; PLAN: r0=256(x1), r1=192(y1), r2=270(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 192
LDI r2, 270
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
