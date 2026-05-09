; DESCRIPTION: Places a white line segment connecting (240, 190) to (460, 231).
; PLAN: r0=240(x1), r1=190(y1), r2=460(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 190
LDI r2, 460
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
