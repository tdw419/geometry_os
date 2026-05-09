; DESCRIPTION: Places a green line segment connecting (398, 184) to (361, 215).
; PLAN: r0=398(x1), r1=184(y1), r2=361(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 184
LDI r2, 361
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
