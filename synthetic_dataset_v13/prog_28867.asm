; DESCRIPTION: Composite: Creates a red circular shape at (291, 161) with radius 74 then Places a yellow 113x53 rectangle at position (342, 0) then Renders a white line between points (223, 77) and (256, 183).
; PLAN: r0=291(x), r1=161(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=0(y), r7=113(width), r8=53(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=223(x1), r11=77(y1), r12=256(x2), r13=183(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 161
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 0
LDI r7, 113
LDI r8, 53
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 77
LDI r12, 256
LDI r13, 183
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
