; DESCRIPTION: Places a cyan line segment connecting (245, 130) to (250, 151).
; PLAN: r0=245(x1), r1=130(y1), r2=250(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 130
LDI r2, 250
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
