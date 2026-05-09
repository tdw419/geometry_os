; DESCRIPTION: Places a cyan line segment connecting (10, 67) to (23, 242).
; PLAN: r0=10(x1), r1=67(y1), r2=23(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 67
LDI r2, 23
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
