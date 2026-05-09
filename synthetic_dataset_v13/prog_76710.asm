; DESCRIPTION: Places a cyan line segment connecting (501, 159) to (420, 186).
; PLAN: r0=501(x1), r1=159(y1), r2=420(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 159
LDI r2, 420
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
