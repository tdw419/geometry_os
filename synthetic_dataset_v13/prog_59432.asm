; DESCRIPTION: Places a cyan line segment connecting (440, 26) to (450, 165).
; PLAN: r0=440(x1), r1=26(y1), r2=450(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 26
LDI r2, 450
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
