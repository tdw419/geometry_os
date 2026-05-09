; DESCRIPTION: Composite: Sets a single orange pixel at (274, 120) then Renders a black box of size 58x64 starting at (233, 168) then Renders a magenta disk with center (40, 41) and radius 22.
; PLAN: r0=274(x), r1=120(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=233(x), r6=168(y), r7=58(width), r8=64(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=40(x), r11=41(y), r12=22(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 274
LDI r1, 120
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 233
LDI r6, 168
LDI r7, 58
LDI r8, 64
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 40
LDI r11, 41
LDI r12, 22
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
