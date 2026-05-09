; DESCRIPTION: Composite: Draws a blue line from (509, 165) to (488, 226) then Places a red circle of radius 20 at center (242, 79) then Places a cyan dot at position (2, 14).
; PLAN: r0=509(x1), r1=165(y1), r2=488(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=79(y), r7=20(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=2(x), r11=14(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 509
LDI r1, 165
LDI r2, 488
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 79
LDI r7, 20
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 2
LDI r11, 14
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
