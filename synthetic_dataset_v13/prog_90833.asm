; DESCRIPTION: Places a cyan line segment connecting (17, 85) to (279, 164).
; PLAN: r0=17(x1), r1=85(y1), r2=279(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 85
LDI r2, 279
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
