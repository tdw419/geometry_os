; DESCRIPTION: Places a cyan line segment connecting (210, 190) to (328, 19).
; PLAN: r0=210(x1), r1=190(y1), r2=328(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 190
LDI r2, 328
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
