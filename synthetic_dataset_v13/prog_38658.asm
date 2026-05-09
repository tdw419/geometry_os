; DESCRIPTION: Places a cyan line segment connecting (2, 190) to (480, 222).
; PLAN: r0=2(x1), r1=190(y1), r2=480(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 190
LDI r2, 480
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
