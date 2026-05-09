; DESCRIPTION: Places a white line segment connecting (240, 143) to (235, 243).
; PLAN: r0=240(x1), r1=143(y1), r2=235(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 143
LDI r2, 235
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
