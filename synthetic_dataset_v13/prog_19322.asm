; DESCRIPTION: Places a cyan line segment connecting (106, 194) to (1, 107).
; PLAN: r0=106(x1), r1=194(y1), r2=1(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 194
LDI r2, 1
LDI r3, 107
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
