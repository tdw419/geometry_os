; DESCRIPTION: Composite: Creates a orange rectangular region at (396, 82) spanning 48 by 53 pixels then Places a cyan dot at position (103, 113) then Places a orange line segment connecting (295, 50) to (73, 178).
; PLAN: r0=396(x), r1=82(y), r2=48(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x), r6=113(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=295(x1), r11=50(y1), r12=73(x2), r13=178(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 82
LDI r2, 48
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 113
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 295
LDI r11, 50
LDI r12, 73
LDI r13, 178
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
