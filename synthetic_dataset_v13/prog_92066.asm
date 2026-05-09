; DESCRIPTION: Composite: Creates a purple rectangular region at (434, 120) spanning 39 by 60 pixels then Places a cyan dot at position (215, 5) then Creates a purple circular shape at (342, 191) with radius 48.
; PLAN: r0=434(x), r1=120(y), r2=39(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=215(x), r6=5(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=342(x), r11=191(y), r12=48(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 434
LDI r1, 120
LDI r2, 39
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 5
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 342
LDI r11, 191
LDI r12, 48
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
