; DESCRIPTION: Composite: Renders a white line between points (156, 184) and (175, 34) then Renders a white box of size 70x56 starting at (220, 49) then Places a cyan dot at position (39, 183).
; PLAN: r0=156(x1), r1=184(y1), r2=175(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=49(y), r7=70(width), r8=56(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=39(x), r11=183(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 184
LDI r2, 175
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 49
LDI r7, 70
LDI r8, 56
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 183
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
