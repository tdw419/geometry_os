; DESCRIPTION: Composite: Creates a green circular shape at (372, 185) with radius 22 then Renders a yellow line between points (377, 239) and (16, 209) then Places a red dot at position (333, 154).
; PLAN: r0=372(x), r1=185(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x1), r6=239(y1), r7=16(x2), r8=209(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=333(x), r11=154(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 372
LDI r1, 185
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 239
LDI r7, 16
LDI r8, 209
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 154
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
