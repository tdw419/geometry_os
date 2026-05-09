; DESCRIPTION: Places a green line segment connecting (20, 221) to (336, 236).
; PLAN: r0=20(x1), r1=221(y1), r2=336(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 221
LDI r2, 336
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
