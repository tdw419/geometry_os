; DESCRIPTION: Composite: Places a white 99x34 rectangle at position (103, 221) then Draws a red circle centered at (138, 187) with radius 66.
; PLAN: r0=103(x), r1=221(y), r2=99(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=138(x), r6=187(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 103
LDI r1, 221
LDI r2, 99
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 187
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
