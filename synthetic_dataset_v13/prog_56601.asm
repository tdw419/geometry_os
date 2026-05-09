; DESCRIPTION: Places a purple line segment connecting (403, 255) to (446, 43).
; PLAN: r0=403(x1), r1=255(y1), r2=446(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 255
LDI r2, 446
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
