; DESCRIPTION: Places a cyan line segment connecting (382, 205) to (450, 188).
; PLAN: r0=382(x1), r1=205(y1), r2=450(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 205
LDI r2, 450
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
