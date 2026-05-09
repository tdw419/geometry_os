; DESCRIPTION: Places a cyan line segment connecting (244, 209) to (106, 190).
; PLAN: r0=244(x1), r1=209(y1), r2=106(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 209
LDI r2, 106
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
