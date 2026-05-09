; DESCRIPTION: Composite: Draws a cyan circle centered at (154, 124) with radius 68 then Places a blue 22x53 rectangle at position (153, 95).
; PLAN: r0=154(x), r1=124(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=153(x), r6=95(y), r7=22(width), r8=53(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 124
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 153
LDI r6, 95
LDI r7, 22
LDI r8, 53
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
