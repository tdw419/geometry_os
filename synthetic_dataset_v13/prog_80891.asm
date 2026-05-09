; DESCRIPTION: Places a cyan line segment connecting (283, 240) to (226, 52).
; PLAN: r0=283(x1), r1=240(y1), r2=226(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 240
LDI r2, 226
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
