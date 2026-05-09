; DESCRIPTION: Composite: Draws a cyan line from (335, 134) to (41, 64) then Renders a orange box of size 80x90 starting at (50, 152) then Places a red circle of radius 80 at center (358, 141).
; PLAN: r0=335(x1), r1=134(y1), r2=41(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=152(y), r7=80(width), r8=90(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=358(x), r11=141(y), r12=80(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 335
LDI r1, 134
LDI r2, 41
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 152
LDI r7, 80
LDI r8, 90
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 141
LDI r12, 80
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
