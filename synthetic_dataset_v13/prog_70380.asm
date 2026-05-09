; DESCRIPTION: Composite: Places a green dot at position (64, 0) then Places a magenta circle of radius 16 at center (228, 87) then Places a magenta line segment connecting (138, 27) to (174, 110).
; PLAN: r0=64(x), r1=0(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=228(x), r6=87(y), r7=16(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=138(x1), r11=27(y1), r12=174(x2), r13=110(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 64
LDI r1, 0
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 228
LDI r6, 87
LDI r7, 16
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 138
LDI r11, 27
LDI r12, 174
LDI r13, 110
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
