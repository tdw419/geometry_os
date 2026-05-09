; DESCRIPTION: Places a cyan line segment connecting (469, 67) to (398, 127).
; PLAN: r0=469(x1), r1=67(y1), r2=398(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 67
LDI r2, 398
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
