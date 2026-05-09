; DESCRIPTION: Places a cyan line segment connecting (428, 20) to (27, 108).
; PLAN: r0=428(x1), r1=20(y1), r2=27(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 20
LDI r2, 27
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
