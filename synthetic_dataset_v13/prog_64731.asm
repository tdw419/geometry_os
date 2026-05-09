; DESCRIPTION: Composite: Places a blue dot at position (368, 249) then Places a purple 91x72 rectangle at position (210, 85) then Places a white circle of radius 60 at center (231, 108).
; PLAN: r0=368(x), r1=249(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=210(x), r6=85(y), r7=91(width), r8=72(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=231(x), r11=108(y), r12=60(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 368
LDI r1, 249
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 210
LDI r6, 85
LDI r7, 91
LDI r8, 72
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 231
LDI r11, 108
LDI r12, 60
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
