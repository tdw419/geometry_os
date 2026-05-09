; DESCRIPTION: Draws a green line from (239, 115) to (234, 249).
; PLAN: r0=239(x1), r1=115(y1), r2=234(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 115
LDI r2, 234
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
