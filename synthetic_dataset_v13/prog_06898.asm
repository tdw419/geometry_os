; DESCRIPTION: Places a cyan line segment connecting (173, 235) to (373, 116).
; PLAN: r0=173(x1), r1=235(y1), r2=373(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 235
LDI r2, 373
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
