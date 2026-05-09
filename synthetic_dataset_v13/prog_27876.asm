; DESCRIPTION: Composite: Places a yellow circle of radius 43 at center (43, 46) then Renders a orange box of size 81x92 starting at (79, 86).
; PLAN: r0=43(x), r1=46(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x), r6=86(y), r7=81(width), r8=92(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 43
LDI r1, 46
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 86
LDI r7, 81
LDI r8, 92
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
