; DESCRIPTION: Places a cyan line segment connecting (394, 58) to (33, 13).
; PLAN: r0=394(x1), r1=58(y1), r2=33(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 58
LDI r2, 33
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
