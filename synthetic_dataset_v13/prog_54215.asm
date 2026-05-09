; DESCRIPTION: Places a white line segment connecting (180, 224) to (413, 236).
; PLAN: r0=180(x1), r1=224(y1), r2=413(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 224
LDI r2, 413
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
