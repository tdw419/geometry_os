; DESCRIPTION: Draws a yellow line from (25, 99) to (371, 213).
; PLAN: r0=25(x1), r1=99(y1), r2=371(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 99
LDI r2, 371
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
