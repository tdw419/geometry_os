; DESCRIPTION: Composite: Creates a green circular shape at (370, 165) with radius 68 then Renders a cyan line between points (58, 7) and (157, 5) then Places a cyan 37x71 rectangle at position (86, 31).
; PLAN: r0=370(x), r1=165(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x1), r6=7(y1), r7=157(x2), r8=5(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=86(x), r11=31(y), r12=37(width), r13=71(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 165
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 7
LDI r7, 157
LDI r8, 5
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 31
LDI r12, 37
LDI r13, 71
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
