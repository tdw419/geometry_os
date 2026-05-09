; DESCRIPTION: Places a cyan line segment connecting (222, 173) to (0, 22).
; PLAN: r0=222(x1), r1=173(y1), r2=0(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 173
LDI r2, 0
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
