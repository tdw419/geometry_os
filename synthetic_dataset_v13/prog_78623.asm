; DESCRIPTION: Places a cyan line segment connecting (59, 8) to (58, 235).
; PLAN: r0=59(x1), r1=8(y1), r2=58(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 8
LDI r2, 58
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
