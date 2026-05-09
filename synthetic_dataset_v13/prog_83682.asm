; DESCRIPTION: Composite: Places a red 118x47 rectangle at position (87, 77) then Renders a cyan disk with center (473, 115) and radius 18 then Draws a green line from (268, 212) to (134, 220).
; PLAN: r0=87(x), r1=77(y), r2=118(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=473(x), r6=115(y), r7=18(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=268(x1), r11=212(y1), r12=134(x2), r13=220(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 77
LDI r2, 118
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 115
LDI r7, 18
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 268
LDI r11, 212
LDI r12, 134
LDI r13, 220
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
