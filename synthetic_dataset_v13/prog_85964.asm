; DESCRIPTION: Draws a cyan line from (359, 40) to (103, 23).
; PLAN: r0=359(x1), r1=40(y1), r2=103(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 40
LDI r2, 103
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
