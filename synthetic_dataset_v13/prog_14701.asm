; DESCRIPTION: Composite: Creates a cyan circular shape at (326, 103) with radius 21 then Draws a purple line from (263, 38) to (443, 67) then Draws a white rectangle at (285, 74) with width 112 and height 69.
; PLAN: r0=326(x), r1=103(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x1), r6=38(y1), r7=443(x2), r8=67(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=285(x), r11=74(y), r12=112(width), r13=69(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 103
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 38
LDI r7, 443
LDI r8, 67
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 74
LDI r12, 112
LDI r13, 69
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
