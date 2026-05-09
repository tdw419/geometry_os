; DESCRIPTION: Composite: Creates a red rectangular region at (184, 19) spanning 21 by 46 pixels then Places a blue dot at position (481, 243) then Renders a white line between points (492, 105) and (25, 242).
; PLAN: r0=184(x), r1=19(y), r2=21(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=481(x), r6=243(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=492(x1), r11=105(y1), r12=25(x2), r13=242(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 19
LDI r2, 21
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 243
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 492
LDI r11, 105
LDI r12, 25
LDI r13, 242
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
