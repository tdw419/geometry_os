; DESCRIPTION: Composite: Creates a blue rectangular region at (86, 223) spanning 104 by 27 pixels then Renders a blue line between points (213, 250) and (330, 166) then Places a white dot at position (302, 100).
; PLAN: r0=86(x), r1=223(y), r2=104(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x1), r6=250(y1), r7=330(x2), r8=166(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=302(x), r11=100(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 86
LDI r1, 223
LDI r2, 104
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 250
LDI r7, 330
LDI r8, 166
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 100
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
