; DESCRIPTION: Composite: Creates a red rectangular region at (349, 32) spanning 81 by 68 pixels then Sets a single cyan pixel at (330, 50) then Creates a green circular shape at (288, 122) with radius 16.
; PLAN: r0=349(x), r1=32(y), r2=81(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x), r6=50(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=288(x), r11=122(y), r12=16(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 349
LDI r1, 32
LDI r2, 81
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 50
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 288
LDI r11, 122
LDI r12, 16
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
