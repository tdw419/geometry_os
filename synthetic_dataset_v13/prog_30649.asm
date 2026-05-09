; DESCRIPTION: Places a green line segment connecting (446, 46) to (235, 95).
; PLAN: r0=446(x1), r1=46(y1), r2=235(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 46
LDI r2, 235
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
