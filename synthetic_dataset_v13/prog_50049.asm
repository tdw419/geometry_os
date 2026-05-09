; DESCRIPTION: Composite: Renders a yellow disk with center (52, 145) and radius 51 then Places a yellow 106x10 rectangle at position (68, 239) then Places a magenta dot at position (98, 72).
; PLAN: r0=52(x), r1=145(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=239(y), r7=106(width), r8=10(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=98(x), r11=72(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 52
LDI r1, 145
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 239
LDI r7, 106
LDI r8, 10
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 72
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
