; DESCRIPTION: Composite: Draws a white line from (481, 251) to (127, 121) then Places a red 13x73 rectangle at position (300, 41).
; PLAN: r0=481(x1), r1=251(y1), r2=127(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=41(y), r7=13(width), r8=73(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 481
LDI r1, 251
LDI r2, 127
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 41
LDI r7, 13
LDI r8, 73
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
