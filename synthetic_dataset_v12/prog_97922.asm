; DESCRIPTION: Places a cyan line segment connecting (262, 26) to (482, 238).
; PLAN: r0=262(x1), r1=26(y1), r2=482(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 26
LDI r2, 482
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
