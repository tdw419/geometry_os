; DESCRIPTION: Composite: Places a white 19x72 rectangle at position (47, 162) then Renders a magenta line between points (35, 239) and (209, 120) then Places a cyan circle of radius 64 at center (276, 141).
; PLAN: r0=47(x), r1=162(y), r2=19(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=35(x1), r6=239(y1), r7=209(x2), r8=120(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=276(x), r11=141(y), r12=64(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 47
LDI r1, 162
LDI r2, 19
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 239
LDI r7, 209
LDI r8, 120
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 141
LDI r12, 64
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
