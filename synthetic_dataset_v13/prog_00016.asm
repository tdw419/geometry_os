; DESCRIPTION: Places a purple line segment connecting (146, 151) to (173, 165).
; PLAN: r0=146(x1), r1=151(y1), r2=173(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 151
LDI r2, 173
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
