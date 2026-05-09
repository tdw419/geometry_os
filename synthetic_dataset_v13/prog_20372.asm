; DESCRIPTION: Places a purple line segment connecting (479, 47) to (429, 165).
; PLAN: r0=479(x1), r1=47(y1), r2=429(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 47
LDI r2, 429
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
