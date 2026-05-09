; DESCRIPTION: Composite: Places a orange dot at position (22, 117) then Renders a orange disk with center (326, 133) and radius 73 then Renders a white box of size 114x71 starting at (171, 85).
; PLAN: r0=22(x), r1=117(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=326(x), r6=133(y), r7=73(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=171(x), r11=85(y), r12=114(width), r13=71(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 22
LDI r1, 117
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 326
LDI r6, 133
LDI r7, 73
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 171
LDI r11, 85
LDI r12, 114
LDI r13, 71
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
