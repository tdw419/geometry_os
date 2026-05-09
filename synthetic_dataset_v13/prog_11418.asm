; DESCRIPTION: Places a red line segment connecting (228, 67) to (250, 236).
; PLAN: r0=228(x1), r1=67(y1), r2=250(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 67
LDI r2, 250
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
