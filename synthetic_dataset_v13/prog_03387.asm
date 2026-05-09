; DESCRIPTION: Places a cyan line segment connecting (160, 235) to (426, 168).
; PLAN: r0=160(x1), r1=235(y1), r2=426(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 235
LDI r2, 426
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
