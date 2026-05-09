; DESCRIPTION: Places a cyan line segment connecting (318, 39) to (154, 189).
; PLAN: r0=318(x1), r1=39(y1), r2=154(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 39
LDI r2, 154
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
