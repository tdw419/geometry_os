; DESCRIPTION: Places a cyan line segment connecting (328, 50) to (492, 3).
; PLAN: r0=328(x1), r1=50(y1), r2=492(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 50
LDI r2, 492
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
