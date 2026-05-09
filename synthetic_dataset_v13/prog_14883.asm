; DESCRIPTION: Places a purple line segment connecting (108, 240) to (499, 213).
; PLAN: r0=108(x1), r1=240(y1), r2=499(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 240
LDI r2, 499
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
