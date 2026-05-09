; DESCRIPTION: Composite: Renders a blue box of size 51x53 starting at (365, 7) then Sets a single orange pixel at (279, 232) then Places a yellow circle of radius 35 at center (431, 190).
; PLAN: r0=365(x), r1=7(y), r2=51(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=279(x), r6=232(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=431(x), r11=190(y), r12=35(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 365
LDI r1, 7
LDI r2, 51
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 232
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 431
LDI r11, 190
LDI r12, 35
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
