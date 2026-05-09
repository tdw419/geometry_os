; DESCRIPTION: Places a cyan line segment connecting (318, 209) to (86, 152).
; PLAN: r0=318(x1), r1=209(y1), r2=86(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 209
LDI r2, 86
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
