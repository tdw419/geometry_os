; DESCRIPTION: Composite: Places a white 113x64 rectangle at position (352, 122) then Places a white circle of radius 55 at center (95, 178).
; PLAN: r0=352(x), r1=122(y), r2=113(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x), r6=178(y), r7=55(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 352
LDI r1, 122
LDI r2, 113
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 178
LDI r7, 55
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
