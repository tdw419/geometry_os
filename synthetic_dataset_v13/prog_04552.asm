; DESCRIPTION: Places a cyan line segment connecting (217, 96) to (108, 155).
; PLAN: r0=217(x1), r1=96(y1), r2=108(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 96
LDI r2, 108
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
