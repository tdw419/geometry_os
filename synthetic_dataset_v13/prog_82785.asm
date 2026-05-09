; DESCRIPTION: Places a cyan line segment connecting (268, 196) to (13, 168).
; PLAN: r0=268(x1), r1=196(y1), r2=13(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 196
LDI r2, 13
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
