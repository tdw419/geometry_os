; DESCRIPTION: Composite: Places a blue dot at position (290, 145) then Places a cyan 113x117 rectangle at position (174, 24) then Creates a cyan circular shape at (330, 120) with radius 65.
; PLAN: r0=290(x), r1=145(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=174(x), r6=24(y), r7=113(width), r8=117(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=330(x), r11=120(y), r12=65(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 145
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 174
LDI r6, 24
LDI r7, 113
LDI r8, 117
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 120
LDI r12, 65
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
