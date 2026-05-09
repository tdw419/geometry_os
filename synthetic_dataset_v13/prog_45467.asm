; DESCRIPTION: Places a cyan line segment connecting (277, 73) to (90, 67).
; PLAN: r0=277(x1), r1=73(y1), r2=90(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 73
LDI r2, 90
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
