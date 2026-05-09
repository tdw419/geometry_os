; DESCRIPTION: Places a cyan line segment connecting (327, 254) to (17, 13).
; PLAN: r0=327(x1), r1=254(y1), r2=17(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 254
LDI r2, 17
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
