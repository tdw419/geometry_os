; DESCRIPTION: Draws a cyan line from (226, 192) to (128, 46).
; PLAN: r0=226(x1), r1=192(y1), r2=128(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 192
LDI r2, 128
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
