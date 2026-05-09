; DESCRIPTION: Composite: Sets a single white pixel at (244, 29) then Draws a purple rectangle at (103, 120) with width 111 and height 98 then Draws a cyan line from (270, 106) to (173, 218).
; PLAN: r0=244(x), r1=29(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=103(x), r6=120(y), r7=111(width), r8=98(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=270(x1), r11=106(y1), r12=173(x2), r13=218(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 29
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 103
LDI r6, 120
LDI r7, 111
LDI r8, 98
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 106
LDI r12, 173
LDI r13, 218
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
