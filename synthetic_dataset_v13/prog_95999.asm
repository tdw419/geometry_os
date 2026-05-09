; DESCRIPTION: Draws a green line from (175, 172) to (210, 14).
; PLAN: r0=175(x1), r1=172(y1), r2=210(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 172
LDI r2, 210
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
