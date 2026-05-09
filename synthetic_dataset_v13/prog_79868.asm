; DESCRIPTION: Places a cyan line segment connecting (284, 165) to (58, 251).
; PLAN: r0=284(x1), r1=165(y1), r2=58(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 165
LDI r2, 58
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
