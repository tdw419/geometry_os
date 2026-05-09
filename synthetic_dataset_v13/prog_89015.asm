; DESCRIPTION: Composite: Places a green dot at position (25, 153) then Places a orange 117x38 rectangle at position (175, 47) then Places a blue circle of radius 65 at center (330, 66).
; PLAN: r0=25(x), r1=153(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=175(x), r6=47(y), r7=117(width), r8=38(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=330(x), r11=66(y), r12=65(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 25
LDI r1, 153
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 175
LDI r6, 47
LDI r7, 117
LDI r8, 38
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 66
LDI r12, 65
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
