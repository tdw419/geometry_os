; DESCRIPTION: Composite: Creates a black circular shape at (91, 131) with radius 66 then Renders a magenta line between points (160, 2) and (166, 50) then Renders a cyan box of size 23x51 starting at (24, 146).
; PLAN: r0=91(x), r1=131(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x1), r6=2(y1), r7=166(x2), r8=50(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=24(x), r11=146(y), r12=23(width), r13=51(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 131
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 2
LDI r7, 166
LDI r8, 50
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 24
LDI r11, 146
LDI r12, 23
LDI r13, 51
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
