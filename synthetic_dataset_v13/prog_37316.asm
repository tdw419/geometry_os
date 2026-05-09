; DESCRIPTION: Composite: Draws a white line from (284, 33) to (22, 13) then Draws a red circle centered at (435, 69) with radius 24.
; PLAN: r0=284(x1), r1=33(y1), r2=22(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=435(x), r6=69(y), r7=24(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 284
LDI r1, 33
LDI r2, 22
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 69
LDI r7, 24
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
