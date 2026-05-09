; DESCRIPTION: Composite: Renders a green line between points (381, 53) and (57, 231) then Renders a yellow box of size 18x48 starting at (218, 69).
; PLAN: r0=381(x1), r1=53(y1), r2=57(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=69(y), r7=18(width), r8=48(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 53
LDI r2, 57
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 69
LDI r7, 18
LDI r8, 48
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
