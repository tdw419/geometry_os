; DESCRIPTION: Places a cyan line segment connecting (381, 28) to (208, 132).
; PLAN: r0=381(x1), r1=28(y1), r2=208(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 28
LDI r2, 208
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
