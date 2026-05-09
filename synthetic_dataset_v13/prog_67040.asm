; DESCRIPTION: Composite: Places a cyan dot at position (460, 168) then Renders a blue disk with center (130, 143) and radius 60 then Places a yellow line segment connecting (10, 191) to (84, 167).
; PLAN: r0=460(x), r1=168(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=143(y), r7=60(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=10(x1), r11=191(y1), r12=84(x2), r13=167(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 460
LDI r1, 168
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 130
LDI r6, 143
LDI r7, 60
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 10
LDI r11, 191
LDI r12, 84
LDI r13, 167
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
