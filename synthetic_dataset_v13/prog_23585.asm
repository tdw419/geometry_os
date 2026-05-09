; DESCRIPTION: Places a cyan line segment connecting (151, 215) to (482, 167).
; PLAN: r0=151(x1), r1=215(y1), r2=482(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 215
LDI r2, 482
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
