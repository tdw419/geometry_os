; DESCRIPTION: Places a cyan line segment connecting (413, 94) to (276, 117).
; PLAN: r0=413(x1), r1=94(y1), r2=276(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 94
LDI r2, 276
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
