; DESCRIPTION: Places a white line segment connecting (327, 47) to (482, 228).
; PLAN: r0=327(x1), r1=47(y1), r2=482(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 47
LDI r2, 482
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
