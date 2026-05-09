; DESCRIPTION: Draws a yellow line from (431, 254) to (445, 209).
; PLAN: r0=431(x1), r1=254(y1), r2=445(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 254
LDI r2, 445
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
