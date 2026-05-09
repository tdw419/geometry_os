; DESCRIPTION: Places a white line segment connecting (180, 57) to (46, 192).
; PLAN: r0=180(x1), r1=57(y1), r2=46(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 57
LDI r2, 46
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
