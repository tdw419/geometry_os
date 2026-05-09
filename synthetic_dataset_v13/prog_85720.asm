; DESCRIPTION: Composite: Creates a blue rectangular region at (344, 132) spanning 54 by 116 pixels then Places a cyan line segment connecting (171, 113) to (291, 82) then Places a cyan dot at position (329, 41).
; PLAN: r0=344(x), r1=132(y), r2=54(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x1), r6=113(y1), r7=291(x2), r8=82(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=329(x), r11=41(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 344
LDI r1, 132
LDI r2, 54
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 113
LDI r7, 291
LDI r8, 82
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 41
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
