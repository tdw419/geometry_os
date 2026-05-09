; DESCRIPTION: Places a green line segment connecting (480, 128) to (340, 235).
; PLAN: r0=480(x1), r1=128(y1), r2=340(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 128
LDI r2, 340
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
