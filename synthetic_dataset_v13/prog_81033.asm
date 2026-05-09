; DESCRIPTION: Places a cyan line segment connecting (329, 0) to (420, 87).
; PLAN: r0=329(x1), r1=0(y1), r2=420(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 0
LDI r2, 420
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
