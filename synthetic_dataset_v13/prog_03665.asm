; DESCRIPTION: Places a magenta line segment connecting (243, 68) to (386, 235).
; PLAN: r0=243(x1), r1=68(y1), r2=386(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 68
LDI r2, 386
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
