; DESCRIPTION: Places a cyan line segment connecting (10, 60) to (428, 173).
; PLAN: r0=10(x1), r1=60(y1), r2=428(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 60
LDI r2, 428
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
