; DESCRIPTION: Composite: Renders a red disk with center (381, 133) and radius 73 then Places a cyan line segment connecting (225, 10) to (428, 111) then Places a red 64x92 rectangle at position (249, 118).
; PLAN: r0=381(x), r1=133(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x1), r6=10(y1), r7=428(x2), r8=111(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=249(x), r11=118(y), r12=64(width), r13=92(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 133
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 10
LDI r7, 428
LDI r8, 111
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 118
LDI r12, 64
LDI r13, 92
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
