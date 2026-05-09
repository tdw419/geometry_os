; DESCRIPTION: Places a cyan line segment connecting (415, 123) to (340, 178).
; PLAN: r0=415(x1), r1=123(y1), r2=340(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 123
LDI r2, 340
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
