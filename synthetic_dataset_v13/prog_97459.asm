; DESCRIPTION: Places a cyan line segment connecting (393, 137) to (239, 19).
; PLAN: r0=393(x1), r1=137(y1), r2=239(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 137
LDI r2, 239
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
