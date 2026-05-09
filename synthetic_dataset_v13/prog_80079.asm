; DESCRIPTION: Composite: Sets a single cyan pixel at (356, 197) then Creates a white circular shape at (244, 21) with radius 12 then Renders a magenta line between points (196, 15) and (350, 14).
; PLAN: r0=356(x), r1=197(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=244(x), r6=21(y), r7=12(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=196(x1), r11=15(y1), r12=350(x2), r13=14(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 197
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 244
LDI r6, 21
LDI r7, 12
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 196
LDI r11, 15
LDI r12, 350
LDI r13, 14
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
