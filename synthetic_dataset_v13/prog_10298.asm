; DESCRIPTION: Places a cyan line segment connecting (0, 37) to (165, 222).
; PLAN: r0=0(x1), r1=37(y1), r2=165(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 37
LDI r2, 165
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
