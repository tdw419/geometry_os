; DESCRIPTION: Composite: Draws a orange line from (256, 49) to (467, 90) then Renders a cyan disk with center (467, 124) and radius 36 then Places a cyan 113x90 rectangle at position (256, 49).
; PLAN: r0=256(x1), r1=49(y1), r2=467(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=124(y), r7=36(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=256(x), r11=49(y), r12=113(width), r13=90(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 49
LDI r2, 467
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 124
LDI r7, 36
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 256
LDI r11, 49
LDI r12, 113
LDI r13, 90
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
