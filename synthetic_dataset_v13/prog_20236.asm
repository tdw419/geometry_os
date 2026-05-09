; DESCRIPTION: Places a red line segment connecting (424, 176) to (293, 213).
; PLAN: r0=424(x1), r1=176(y1), r2=293(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 176
LDI r2, 293
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
