; DESCRIPTION: Places a red line segment connecting (333, 16) to (228, 190).
; PLAN: r0=333(x1), r1=16(y1), r2=228(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 16
LDI r2, 228
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
