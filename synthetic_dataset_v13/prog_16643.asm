; DESCRIPTION: Composite: Draws a cyan line from (65, 173) to (41, 200) then Places a black circle of radius 10 at center (96, 86) then Renders a cyan box of size 50x92 starting at (190, 71).
; PLAN: r0=65(x1), r1=173(y1), r2=41(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=86(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=190(x), r11=71(y), r12=50(width), r13=92(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 173
LDI r2, 41
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 86
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 190
LDI r11, 71
LDI r12, 50
LDI r13, 92
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
