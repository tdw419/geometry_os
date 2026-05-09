; DESCRIPTION: Draws a cyan line from (300, 80) to (209, 155).
; PLAN: r0=300(x1), r1=80(y1), r2=209(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 80
LDI r2, 209
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
