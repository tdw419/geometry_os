; DESCRIPTION: Composite: Renders a cyan disk with center (238, 95) and radius 61 then Renders a cyan box of size 40x107 starting at (253, 135) then Sets a single white pixel at (121, 216).
; PLAN: r0=238(x), r1=95(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=253(x), r6=135(y), r7=40(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=121(x), r11=216(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 238
LDI r1, 95
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 253
LDI r6, 135
LDI r7, 40
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 121
LDI r11, 216
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
