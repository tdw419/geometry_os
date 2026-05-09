; DESCRIPTION: Composite: Places a blue dot at position (57, 112) then Creates a orange rectangular region at (425, 133) spanning 32 by 108 pixels then Places a purple circle of radius 61 at center (443, 112).
; PLAN: r0=57(x), r1=112(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=425(x), r6=133(y), r7=32(width), r8=108(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=443(x), r11=112(y), r12=61(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 57
LDI r1, 112
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 425
LDI r6, 133
LDI r7, 32
LDI r8, 108
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 443
LDI r11, 112
LDI r12, 61
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
