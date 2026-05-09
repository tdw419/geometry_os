; DESCRIPTION: Composite: Creates a red rectangular region at (112, 71) spanning 51 by 101 pixels then Renders a cyan line between points (487, 28) and (196, 121) then Places a white circle of radius 80 at center (156, 100).
; PLAN: r0=112(x), r1=71(y), r2=51(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=487(x1), r6=28(y1), r7=196(x2), r8=121(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=156(x), r11=100(y), r12=80(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 112
LDI r1, 71
LDI r2, 51
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 28
LDI r7, 196
LDI r8, 121
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 100
LDI r12, 80
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
