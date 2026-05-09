; DESCRIPTION: Composite: Creates a cyan rectangular region at (300, 174) spanning 81 by 41 pixels then Places a white dot at position (51, 116) then Creates a red circular shape at (165, 135) with radius 20.
; PLAN: r0=300(x), r1=174(y), r2=81(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=51(x), r6=116(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=165(x), r11=135(y), r12=20(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 300
LDI r1, 174
LDI r2, 81
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 116
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 165
LDI r11, 135
LDI r12, 20
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
