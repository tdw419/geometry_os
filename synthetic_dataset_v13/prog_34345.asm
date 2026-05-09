; DESCRIPTION: Places a cyan line segment connecting (470, 146) to (468, 7).
; PLAN: r0=470(x1), r1=146(y1), r2=468(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 146
LDI r2, 468
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
