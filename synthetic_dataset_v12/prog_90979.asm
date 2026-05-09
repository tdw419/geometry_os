; DESCRIPTION: Places a cyan line segment connecting (33, 50) to (8, 198).
; PLAN: r0=33(x1), r1=50(y1), r2=8(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 50
LDI r2, 8
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
