; DESCRIPTION: Places a red line segment connecting (499, 127) to (362, 44).
; PLAN: r0=499(x1), r1=127(y1), r2=362(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 127
LDI r2, 362
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
