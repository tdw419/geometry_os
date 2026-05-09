; DESCRIPTION: Composite: Places a blue dot at position (164, 241) then Places a blue 120x11 rectangle at position (56, 144) then Places a black circle of radius 46 at center (54, 146).
; PLAN: r0=164(x), r1=241(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=56(x), r6=144(y), r7=120(width), r8=11(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=54(x), r11=146(y), r12=46(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 164
LDI r1, 241
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 56
LDI r6, 144
LDI r7, 120
LDI r8, 11
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 146
LDI r12, 46
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
