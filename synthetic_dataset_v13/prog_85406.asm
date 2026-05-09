; DESCRIPTION: Draws a green line from (495, 53) to (239, 18).
; PLAN: r0=495(x1), r1=53(y1), r2=239(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 53
LDI r2, 239
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
