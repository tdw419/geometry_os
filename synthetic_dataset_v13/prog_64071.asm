; DESCRIPTION: Places a cyan line segment connecting (299, 131) to (243, 72).
; PLAN: r0=299(x1), r1=131(y1), r2=243(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 131
LDI r2, 243
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
