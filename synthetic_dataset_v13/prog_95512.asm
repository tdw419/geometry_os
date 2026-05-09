; DESCRIPTION: Draws a yellow line from (480, 29) to (193, 13).
; PLAN: r0=480(x1), r1=29(y1), r2=193(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 29
LDI r2, 193
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
