; DESCRIPTION: Places a green line segment connecting (150, 205) to (380, 31).
; PLAN: r0=150(x1), r1=205(y1), r2=380(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 205
LDI r2, 380
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
