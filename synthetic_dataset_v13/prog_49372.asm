; DESCRIPTION: Places a cyan line segment connecting (164, 50) to (47, 221).
; PLAN: r0=164(x1), r1=50(y1), r2=47(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 50
LDI r2, 47
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
