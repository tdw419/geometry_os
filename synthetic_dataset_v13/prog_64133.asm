; DESCRIPTION: Composite: Places a cyan line segment connecting (396, 109) to (307, 93) then Places a white circle of radius 60 at center (415, 69) then Places a purple 39x82 rectangle at position (455, 49).
; PLAN: r0=396(x1), r1=109(y1), r2=307(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=69(y), r7=60(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=455(x), r11=49(y), r12=39(width), r13=82(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 109
LDI r2, 307
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 69
LDI r7, 60
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 455
LDI r11, 49
LDI r12, 39
LDI r13, 82
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
