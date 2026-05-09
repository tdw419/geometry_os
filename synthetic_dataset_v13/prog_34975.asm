; DESCRIPTION: Draws a green line from (435, 213) to (338, 175).
; PLAN: r0=435(x1), r1=213(y1), r2=338(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 213
LDI r2, 338
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
