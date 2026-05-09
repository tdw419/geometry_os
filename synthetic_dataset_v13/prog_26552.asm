; DESCRIPTION: Draws a green line from (393, 255) to (97, 40).
; PLAN: r0=393(x1), r1=255(y1), r2=97(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 255
LDI r2, 97
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
