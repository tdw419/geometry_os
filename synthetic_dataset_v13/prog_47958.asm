; DESCRIPTION: Places a cyan line segment connecting (309, 215) to (72, 147).
; PLAN: r0=309(x1), r1=215(y1), r2=72(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 215
LDI r2, 72
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
