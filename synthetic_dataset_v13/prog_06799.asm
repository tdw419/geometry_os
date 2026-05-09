; DESCRIPTION: Places a cyan line segment connecting (419, 239) to (73, 59).
; PLAN: r0=419(x1), r1=239(y1), r2=73(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 239
LDI r2, 73
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
