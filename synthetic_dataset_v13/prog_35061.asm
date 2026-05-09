; DESCRIPTION: Places a cyan line segment connecting (324, 0) to (338, 213).
; PLAN: r0=324(x1), r1=0(y1), r2=338(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 0
LDI r2, 338
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
