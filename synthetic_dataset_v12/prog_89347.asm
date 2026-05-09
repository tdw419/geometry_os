; DESCRIPTION: Places a cyan line segment connecting (106, 173) to (498, 190).
; PLAN: r0=106(x1), r1=173(y1), r2=498(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 173
LDI r2, 498
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
