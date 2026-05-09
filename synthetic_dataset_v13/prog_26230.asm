; DESCRIPTION: Composite: Renders a purple disk with center (395, 92) and radius 38 then Places a white line segment connecting (9, 209) to (380, 221) then Places a magenta 45x115 rectangle at position (39, 71).
; PLAN: r0=395(x), r1=92(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=9(x1), r6=209(y1), r7=380(x2), r8=221(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=39(x), r11=71(y), r12=45(width), r13=115(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 92
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 9
LDI r6, 209
LDI r7, 380
LDI r8, 221
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 71
LDI r12, 45
LDI r13, 115
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
