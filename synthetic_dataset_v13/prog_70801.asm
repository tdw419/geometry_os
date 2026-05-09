; DESCRIPTION: Composite: Renders a black line between points (100, 42) and (33, 200) then Places a red 103x23 rectangle at position (267, 98) then Places a black circle of radius 68 at center (320, 95).
; PLAN: r0=100(x1), r1=42(y1), r2=33(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=98(y), r7=103(width), r8=23(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=320(x), r11=95(y), r12=68(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 100
LDI r1, 42
LDI r2, 33
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 98
LDI r7, 103
LDI r8, 23
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 95
LDI r12, 68
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
