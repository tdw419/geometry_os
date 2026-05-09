; DESCRIPTION: Places a cyan line segment connecting (271, 25) to (183, 81).
; PLAN: r0=271(x1), r1=25(y1), r2=183(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 25
LDI r2, 183
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
