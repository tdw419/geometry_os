; DESCRIPTION: Composite: Renders a magenta box of size 34x82 starting at (164, 117) then Renders a white disk with center (220, 174) and radius 70 then Renders a white line between points (87, 255) and (167, 16).
; PLAN: r0=164(x), r1=117(y), r2=34(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x), r6=174(y), r7=70(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=87(x1), r11=255(y1), r12=167(x2), r13=16(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 117
LDI r2, 34
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 174
LDI r7, 70
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 87
LDI r11, 255
LDI r12, 167
LDI r13, 16
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
