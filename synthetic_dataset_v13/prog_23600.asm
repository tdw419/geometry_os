; DESCRIPTION: Composite: Creates a orange circular shape at (488, 237) with radius 16 then Draws a red line from (434, 237) to (450, 138) then Sets a single yellow pixel at (2, 29).
; PLAN: r0=488(x), r1=237(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=434(x1), r6=237(y1), r7=450(x2), r8=138(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=2(x), r11=29(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 488
LDI r1, 237
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 434
LDI r6, 237
LDI r7, 450
LDI r8, 138
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 2
LDI r11, 29
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
