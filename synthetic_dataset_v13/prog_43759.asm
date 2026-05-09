; DESCRIPTION: Places a cyan line segment connecting (283, 220) to (239, 230).
; PLAN: r0=283(x1), r1=220(y1), r2=239(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 220
LDI r2, 239
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
