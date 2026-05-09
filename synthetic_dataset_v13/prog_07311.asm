; DESCRIPTION: Composite: Renders a yellow box of size 59x79 starting at (198, 61) then Renders a black disk with center (256, 64) and radius 47 then Sets a single cyan pixel at (174, 125).
; PLAN: r0=198(x), r1=61(y), r2=59(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x), r6=64(y), r7=47(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=174(x), r11=125(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 198
LDI r1, 61
LDI r2, 59
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 64
LDI r7, 47
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 174
LDI r11, 125
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
