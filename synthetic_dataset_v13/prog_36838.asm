; DESCRIPTION: Places a cyan line segment connecting (482, 3) to (299, 186).
; PLAN: r0=482(x1), r1=3(y1), r2=299(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 3
LDI r2, 299
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
