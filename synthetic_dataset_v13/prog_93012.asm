; DESCRIPTION: Composite: Renders a orange box of size 55x52 starting at (336, 55) then Places a yellow circle of radius 29 at center (76, 213).
; PLAN: r0=336(x), r1=55(y), r2=55(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x), r6=213(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 336
LDI r1, 55
LDI r2, 55
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 213
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
