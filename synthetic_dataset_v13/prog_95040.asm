; DESCRIPTION: Composite: Creates a orange rectangular region at (281, 30) spanning 117 by 34 pixels then Draws a green line from (493, 115) to (215, 131) then Places a magenta dot at position (41, 13).
; PLAN: r0=281(x), r1=30(y), r2=117(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=493(x1), r6=115(y1), r7=215(x2), r8=131(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=41(x), r11=13(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 281
LDI r1, 30
LDI r2, 117
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 493
LDI r6, 115
LDI r7, 215
LDI r8, 131
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 41
LDI r11, 13
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
