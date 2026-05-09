; DESCRIPTION: Composite: Renders a black box of size 13x45 starting at (149, 36) then Draws a white line from (456, 108) to (2, 183).
; PLAN: r0=149(x), r1=36(y), r2=13(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x1), r6=108(y1), r7=2(x2), r8=183(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 149
LDI r1, 36
LDI r2, 13
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 108
LDI r7, 2
LDI r8, 183
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
