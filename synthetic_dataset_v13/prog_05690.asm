; DESCRIPTION: Places a cyan line segment connecting (432, 103) to (295, 67).
; PLAN: r0=432(x1), r1=103(y1), r2=295(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 103
LDI r2, 295
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
