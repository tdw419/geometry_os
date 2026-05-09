; DESCRIPTION: Composite: Draws a black rectangle at (264, 25) with width 41 and height 62 then Renders a white line between points (59, 38) and (488, 223).
; PLAN: r0=264(x), r1=25(y), r2=41(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=59(x1), r6=38(y1), r7=488(x2), r8=223(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 25
LDI r2, 41
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 38
LDI r7, 488
LDI r8, 223
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
