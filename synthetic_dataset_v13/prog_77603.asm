; DESCRIPTION: Places a cyan line segment connecting (167, 97) to (319, 27).
; PLAN: r0=167(x1), r1=97(y1), r2=319(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 97
LDI r2, 319
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
