; DESCRIPTION: Composite: Creates a green circular shape at (59, 182) with radius 32 then Places a magenta dot at position (330, 44) then Creates a red rectangular region at (337, 1) spanning 10 by 112 pixels.
; PLAN: r0=59(x), r1=182(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=330(x), r6=44(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=337(x), r11=1(y), r12=10(width), r13=112(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 182
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 330
LDI r6, 44
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 337
LDI r11, 1
LDI r12, 10
LDI r13, 112
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
