; DESCRIPTION: Composite: Places a blue dot at position (70, 23) then Draws a yellow circle centered at (479, 89) with radius 12 then Renders a blue box of size 40x25 starting at (367, 87).
; PLAN: r0=70(x), r1=23(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=479(x), r6=89(y), r7=12(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=367(x), r11=87(y), r12=40(width), r13=25(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 23
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 479
LDI r6, 89
LDI r7, 12
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 367
LDI r11, 87
LDI r12, 40
LDI r13, 25
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
