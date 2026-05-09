; DESCRIPTION: Composite: Draws a white rectangle at (467, 24) with width 28 and height 103 then Sets a single red pixel at (461, 48) then Renders a cyan line between points (409, 115) and (187, 47).
; PLAN: r0=467(x), r1=24(y), r2=28(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=461(x), r6=48(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=409(x1), r11=115(y1), r12=187(x2), r13=47(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 467
LDI r1, 24
LDI r2, 28
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 48
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 409
LDI r11, 115
LDI r12, 187
LDI r13, 47
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
