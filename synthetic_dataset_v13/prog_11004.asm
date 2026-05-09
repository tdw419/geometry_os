; DESCRIPTION: Places a cyan line segment connecting (371, 103) to (53, 71).
; PLAN: r0=371(x1), r1=103(y1), r2=53(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 103
LDI r2, 53
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
