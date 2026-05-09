; DESCRIPTION: Draws a purple line from (255, 33) to (48, 125).
; PLAN: r0=255(x1), r1=33(y1), r2=48(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 33
LDI r2, 48
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
