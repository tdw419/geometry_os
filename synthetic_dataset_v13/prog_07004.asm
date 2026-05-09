; DESCRIPTION: Composite: Creates a magenta rectangular region at (200, 123) spanning 110 by 102 pixels then Sets a single green pixel at (197, 167) then Places a magenta circle of radius 21 at center (27, 177).
; PLAN: r0=200(x), r1=123(y), r2=110(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x), r6=167(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=27(x), r11=177(y), r12=21(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 200
LDI r1, 123
LDI r2, 110
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 167
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 27
LDI r11, 177
LDI r12, 21
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
