; DESCRIPTION: Places a cyan line segment connecting (180, 164) to (316, 76).
; PLAN: r0=180(x1), r1=164(y1), r2=316(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 164
LDI r2, 316
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
