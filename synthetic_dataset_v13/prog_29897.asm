; DESCRIPTION: Places a green line segment connecting (264, 173) to (491, 235).
; PLAN: r0=264(x1), r1=173(y1), r2=491(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 173
LDI r2, 491
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
