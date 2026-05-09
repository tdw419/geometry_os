; DESCRIPTION: Composite: Renders a magenta disk with center (297, 219) and radius 26 then Renders a cyan box of size 80x116 starting at (15, 47) then Places a black dot at position (187, 153).
; PLAN: r0=297(x), r1=219(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=47(y), r7=80(width), r8=116(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=187(x), r11=153(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 297
LDI r1, 219
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 47
LDI r7, 80
LDI r8, 116
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 153
LDI r12, 0x000000
PSET r10, r11, r12
HALT
