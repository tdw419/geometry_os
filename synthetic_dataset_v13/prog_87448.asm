; DESCRIPTION: Composite: Renders a black box of size 52x92 starting at (126, 42) then Draws a cyan line from (377, 213) to (74, 19) then Creates a cyan circular shape at (437, 98) with radius 28.
; PLAN: r0=126(x), r1=42(y), r2=52(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x1), r6=213(y1), r7=74(x2), r8=19(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=437(x), r11=98(y), r12=28(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 126
LDI r1, 42
LDI r2, 52
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 213
LDI r7, 74
LDI r8, 19
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 437
LDI r11, 98
LDI r12, 28
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
