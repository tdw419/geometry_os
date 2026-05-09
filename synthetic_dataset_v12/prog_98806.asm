; DESCRIPTION: Places a cyan line segment connecting (106, 197) to (338, 59).
; PLAN: r0=106(x1), r1=197(y1), r2=338(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 197
LDI r2, 338
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
