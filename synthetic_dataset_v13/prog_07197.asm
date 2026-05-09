; DESCRIPTION: Places a black line segment connecting (213, 155) to (410, 240).
; PLAN: r0=213(x1), r1=155(y1), r2=410(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 155
LDI r2, 410
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
