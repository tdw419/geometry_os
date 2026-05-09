; DESCRIPTION: Places a cyan line segment connecting (309, 152) to (85, 28).
; PLAN: r0=309(x1), r1=152(y1), r2=85(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 152
LDI r2, 85
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
