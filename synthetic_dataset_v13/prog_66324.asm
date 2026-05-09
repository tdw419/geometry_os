; DESCRIPTION: Places a cyan line segment connecting (65, 84) to (20, 209).
; PLAN: r0=65(x1), r1=84(y1), r2=20(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 84
LDI r2, 20
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
