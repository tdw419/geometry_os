; DESCRIPTION: Composite: Draws a black rectangle at (1, 135) with width 88 and height 119 then Places a white line segment connecting (403, 48) to (446, 135).
; PLAN: r0=1(x), r1=135(y), r2=88(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x1), r6=48(y1), r7=446(x2), r8=135(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 1
LDI r1, 135
LDI r2, 88
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 48
LDI r7, 446
LDI r8, 135
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
