; DESCRIPTION: Composite: Places a white 115x42 rectangle at position (310, 141) then Renders a cyan line between points (45, 170) and (424, 138) then Places a blue dot at position (154, 214).
; PLAN: r0=310(x), r1=141(y), r2=115(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x1), r6=170(y1), r7=424(x2), r8=138(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=154(x), r11=214(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 310
LDI r1, 141
LDI r2, 115
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 170
LDI r7, 424
LDI r8, 138
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 214
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
