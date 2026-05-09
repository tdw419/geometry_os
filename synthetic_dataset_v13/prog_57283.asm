; DESCRIPTION: Places a cyan line segment connecting (470, 24) to (411, 126).
; PLAN: r0=470(x1), r1=24(y1), r2=411(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 24
LDI r2, 411
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
