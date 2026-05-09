; DESCRIPTION: Composite: Renders a cyan disk with center (180, 132) and radius 75 then Places a red 114x103 rectangle at position (86, 125) then Renders a blue line between points (274, 180) and (176, 18).
; PLAN: r0=180(x), r1=132(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x), r6=125(y), r7=114(width), r8=103(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=274(x1), r11=180(y1), r12=176(x2), r13=18(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 180
LDI r1, 132
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 125
LDI r7, 114
LDI r8, 103
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 180
LDI r12, 176
LDI r13, 18
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
