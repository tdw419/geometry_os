; DESCRIPTION: Composite: Places a cyan circle of radius 60 at center (64, 73) then Renders a blue box of size 96x91 starting at (238, 141) then Sets a single orange pixel at (187, 135).
; PLAN: r0=64(x), r1=73(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=238(x), r6=141(y), r7=96(width), r8=91(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=187(x), r11=135(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 64
LDI r1, 73
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 238
LDI r6, 141
LDI r7, 96
LDI r8, 91
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 135
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
