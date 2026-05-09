; DESCRIPTION: Places a cyan line segment connecting (144, 209) to (264, 89).
; PLAN: r0=144(x1), r1=209(y1), r2=264(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 209
LDI r2, 264
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
