; DESCRIPTION: Composite: Places a cyan line segment connecting (408, 242) to (264, 115) then Draws a white circle centered at (249, 122) with radius 24.
; PLAN: r0=408(x1), r1=242(y1), r2=264(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=122(y), r7=24(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 408
LDI r1, 242
LDI r2, 264
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 122
LDI r7, 24
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
