; DESCRIPTION: Places a cyan line segment connecting (356, 57) to (182, 242).
; PLAN: r0=356(x1), r1=57(y1), r2=182(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 57
LDI r2, 182
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
