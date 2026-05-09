; DESCRIPTION: Composite: Draws a green line from (8, 67) to (468, 141) then Creates a white rectangular region at (45, 127) spanning 53 by 83 pixels.
; PLAN: r0=8(x1), r1=67(y1), r2=468(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=127(y), r7=53(width), r8=83(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 8
LDI r1, 67
LDI r2, 468
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 127
LDI r7, 53
LDI r8, 83
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
