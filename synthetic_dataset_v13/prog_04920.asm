; DESCRIPTION: Composite: Renders a orange disk with center (435, 74) and radius 20 then Places a white dot at position (62, 220) then Renders a purple box of size 55x47 starting at (103, 114).
; PLAN: r0=435(x), r1=74(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=62(x), r6=220(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=103(x), r11=114(y), r12=55(width), r13=47(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 435
LDI r1, 74
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 62
LDI r6, 220
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 103
LDI r11, 114
LDI r12, 55
LDI r13, 47
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
