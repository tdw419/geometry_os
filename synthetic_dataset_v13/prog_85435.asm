; DESCRIPTION: Places a cyan line segment connecting (239, 108) to (26, 249).
; PLAN: r0=239(x1), r1=108(y1), r2=26(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 108
LDI r2, 26
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
