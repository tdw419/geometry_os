; DESCRIPTION: Places a cyan line segment connecting (328, 248) to (123, 8).
; PLAN: r0=328(x1), r1=248(y1), r2=123(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 248
LDI r2, 123
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
