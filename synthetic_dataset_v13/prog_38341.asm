; DESCRIPTION: Composite: Sets a single orange pixel at (202, 162) then Places a yellow circle of radius 33 at center (437, 42) then Renders a blue box of size 105x51 starting at (111, 47).
; PLAN: r0=202(x), r1=162(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=437(x), r6=42(y), r7=33(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=111(x), r11=47(y), r12=105(width), r13=51(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 202
LDI r1, 162
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 437
LDI r6, 42
LDI r7, 33
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 111
LDI r11, 47
LDI r12, 105
LDI r13, 51
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
