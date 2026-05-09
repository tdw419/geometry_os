; DESCRIPTION: Composite: Places a red circle of radius 38 at center (174, 48) then Sets a single purple pixel at (412, 199) then Renders a cyan box of size 79x24 starting at (282, 56).
; PLAN: r0=174(x), r1=48(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=412(x), r6=199(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=282(x), r11=56(y), r12=79(width), r13=24(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 48
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 412
LDI r6, 199
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 282
LDI r11, 56
LDI r12, 79
LDI r13, 24
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
