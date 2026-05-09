; DESCRIPTION: Draws a green line from (209, 25) to (193, 16).
; PLAN: r0=209(x1), r1=25(y1), r2=193(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 25
LDI r2, 193
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
