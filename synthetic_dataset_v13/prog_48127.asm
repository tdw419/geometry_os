; DESCRIPTION: Places a cyan line segment connecting (269, 245) to (394, 137).
; PLAN: r0=269(x1), r1=245(y1), r2=394(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 245
LDI r2, 394
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
