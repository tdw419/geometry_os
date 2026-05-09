; DESCRIPTION: Places a cyan line segment connecting (470, 167) to (108, 20).
; PLAN: r0=470(x1), r1=167(y1), r2=108(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 167
LDI r2, 108
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
