; DESCRIPTION: Composite: Draws a orange circle centered at (153, 93) with radius 50 then Sets a single green pixel at (488, 197) then Renders a blue box of size 67x21 starting at (401, 76).
; PLAN: r0=153(x), r1=93(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=488(x), r6=197(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=401(x), r11=76(y), r12=67(width), r13=21(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 93
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 488
LDI r6, 197
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 401
LDI r11, 76
LDI r12, 67
LDI r13, 21
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
