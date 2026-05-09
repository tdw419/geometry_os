; DESCRIPTION: Places a cyan line segment connecting (165, 64) to (246, 166).
; PLAN: r0=165(x1), r1=64(y1), r2=246(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 64
LDI r2, 246
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
