; DESCRIPTION: Composite: Places a blue dot at position (161, 223) then Renders a magenta box of size 115x64 starting at (372, 143) then Places a blue circle of radius 27 at center (441, 225).
; PLAN: r0=161(x), r1=223(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=372(x), r6=143(y), r7=115(width), r8=64(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=441(x), r11=225(y), r12=27(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 161
LDI r1, 223
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 372
LDI r6, 143
LDI r7, 115
LDI r8, 64
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 225
LDI r12, 27
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
