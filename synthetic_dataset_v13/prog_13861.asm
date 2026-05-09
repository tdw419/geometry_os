; DESCRIPTION: Places a cyan line segment connecting (352, 68) to (330, 40).
; PLAN: r0=352(x1), r1=68(y1), r2=330(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 68
LDI r2, 330
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
