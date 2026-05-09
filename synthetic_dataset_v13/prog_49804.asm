; DESCRIPTION: Places a cyan line segment connecting (379, 215) to (351, 146).
; PLAN: r0=379(x1), r1=215(y1), r2=351(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 215
LDI r2, 351
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
