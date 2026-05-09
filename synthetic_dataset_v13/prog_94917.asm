; DESCRIPTION: Places a cyan line segment connecting (294, 222) to (188, 120).
; PLAN: r0=294(x1), r1=222(y1), r2=188(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 222
LDI r2, 188
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
