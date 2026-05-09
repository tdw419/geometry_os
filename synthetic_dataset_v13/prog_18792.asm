; DESCRIPTION: Composite: Renders a white box of size 50x72 starting at (171, 125) then Renders a white line between points (498, 228) and (292, 7) then Draws a cyan circle centered at (409, 157) with radius 47.
; PLAN: r0=171(x), r1=125(y), r2=50(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=498(x1), r6=228(y1), r7=292(x2), r8=7(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=409(x), r11=157(y), r12=47(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 171
LDI r1, 125
LDI r2, 50
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 498
LDI r6, 228
LDI r7, 292
LDI r8, 7
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 157
LDI r12, 47
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
