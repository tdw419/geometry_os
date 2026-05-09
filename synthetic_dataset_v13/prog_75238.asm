; DESCRIPTION: Composite: Draws a green line from (189, 0) to (269, 153) then Renders a white box of size 117x48 starting at (19, 80).
; PLAN: r0=189(x1), r1=0(y1), r2=269(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=19(x), r6=80(y), r7=117(width), r8=48(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 0
LDI r2, 269
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 80
LDI r7, 117
LDI r8, 48
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
