; DESCRIPTION: Composite: Renders a orange box of size 61x72 starting at (228, 100) then Draws a cyan circle centered at (286, 173) with radius 78 then Places a orange line segment connecting (20, 137) to (469, 65).
; PLAN: r0=228(x), r1=100(y), r2=61(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=286(x), r6=173(y), r7=78(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=20(x1), r11=137(y1), r12=469(x2), r13=65(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 228
LDI r1, 100
LDI r2, 61
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 173
LDI r7, 78
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 20
LDI r11, 137
LDI r12, 469
LDI r13, 65
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
