; DESCRIPTION: Composite: Places a cyan line segment connecting (83, 54) to (245, 52) then Renders a white disk with center (103, 115) and radius 78 then Places a orange 70x113 rectangle at position (102, 91).
; PLAN: r0=83(x1), r1=54(y1), r2=245(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=115(y), r7=78(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=102(x), r11=91(y), r12=70(width), r13=113(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 83
LDI r1, 54
LDI r2, 245
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 115
LDI r7, 78
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 102
LDI r11, 91
LDI r12, 70
LDI r13, 113
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
