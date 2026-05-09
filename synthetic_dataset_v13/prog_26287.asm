; DESCRIPTION: Places a cyan line segment connecting (482, 1) to (437, 86).
; PLAN: r0=482(x1), r1=1(y1), r2=437(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 1
LDI r2, 437
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
