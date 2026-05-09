; DESCRIPTION: Places a white line segment connecting (120, 111) to (135, 192).
; PLAN: r0=120(x1), r1=111(y1), r2=135(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 111
LDI r2, 135
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
