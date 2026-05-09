; DESCRIPTION: Draws a green line from (95, 239) to (189, 188).
; PLAN: r0=95(x1), r1=239(y1), r2=189(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 239
LDI r2, 189
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
