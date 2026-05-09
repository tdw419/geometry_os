; DESCRIPTION: Composite: Creates a blue rectangular region at (247, 35) spanning 58 by 53 pixels then Places a black dot at position (470, 79) then Renders a green disk with center (303, 164) and radius 64.
; PLAN: r0=247(x), r1=35(y), r2=58(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x), r6=79(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=303(x), r11=164(y), r12=64(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 247
LDI r1, 35
LDI r2, 58
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 79
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 303
LDI r11, 164
LDI r12, 64
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
