; DESCRIPTION: Composite: Draws a cyan line from (138, 52) to (509, 221) then Renders a white box of size 30x37 starting at (182, 92) then Places a white dot at position (108, 6).
; PLAN: r0=138(x1), r1=52(y1), r2=509(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=182(x), r6=92(y), r7=30(width), r8=37(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=108(x), r11=6(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 138
LDI r1, 52
LDI r2, 509
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 92
LDI r7, 30
LDI r8, 37
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 6
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
