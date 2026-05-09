; DESCRIPTION: Places a blue line segment connecting (239, 63) to (187, 236).
; PLAN: r0=239(x1), r1=63(y1), r2=187(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 63
LDI r2, 187
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
