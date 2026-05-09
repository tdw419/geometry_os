; DESCRIPTION: Places a white line segment connecting (495, 243) to (426, 228).
; PLAN: r0=495(x1), r1=243(y1), r2=426(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 243
LDI r2, 426
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
