; DESCRIPTION: Composite: Renders a cyan disk with center (198, 168) and radius 74 then Sets a single green pixel at (53, 88) then Renders a green box of size 93x11 starting at (8, 93).
; PLAN: r0=198(x), r1=168(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=88(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=8(x), r11=93(y), r12=93(width), r13=11(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 198
LDI r1, 168
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 88
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 8
LDI r11, 93
LDI r12, 93
LDI r13, 11
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
