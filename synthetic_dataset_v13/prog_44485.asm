; DESCRIPTION: Composite: Creates a red rectangular region at (370, 79) spanning 40 by 85 pixels then Renders a magenta line between points (27, 52) and (119, 144) then Places a yellow dot at position (487, 187).
; PLAN: r0=370(x), r1=79(y), r2=40(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=27(x1), r6=52(y1), r7=119(x2), r8=144(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=487(x), r11=187(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 370
LDI r1, 79
LDI r2, 40
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 52
LDI r7, 119
LDI r8, 144
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 487
LDI r11, 187
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
