; DESCRIPTION: Composite: Renders a cyan box of size 95x12 starting at (392, 111) then Sets a single white pixel at (495, 208) then Renders a green disk with center (219, 77) and radius 66.
; PLAN: r0=392(x), r1=111(y), r2=95(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=495(x), r6=208(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=219(x), r11=77(y), r12=66(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 392
LDI r1, 111
LDI r2, 95
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 208
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 219
LDI r11, 77
LDI r12, 66
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
