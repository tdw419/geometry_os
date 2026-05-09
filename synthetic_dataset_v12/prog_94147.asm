; DESCRIPTION: Draws a yellow line from (499, 32) to (305, 16).
; PLAN: r0=499(x1), r1=32(y1), r2=305(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 32
LDI r2, 305
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
