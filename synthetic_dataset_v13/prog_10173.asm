; DESCRIPTION: Composite: Sets a single cyan pixel at (12, 120) then Creates a orange circular shape at (288, 120) with radius 32 then Renders a cyan box of size 16x58 starting at (201, 40).
; PLAN: r0=12(x), r1=120(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=288(x), r6=120(y), r7=32(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=201(x), r11=40(y), r12=16(width), r13=58(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 12
LDI r1, 120
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 288
LDI r6, 120
LDI r7, 32
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 201
LDI r11, 40
LDI r12, 16
LDI r13, 58
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
