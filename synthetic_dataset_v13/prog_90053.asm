; DESCRIPTION: Composite: Renders a orange box of size 83x66 starting at (18, 189) then Places a orange circle of radius 39 at center (243, 92).
; PLAN: r0=18(x), r1=189(y), r2=83(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x), r6=92(y), r7=39(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 18
LDI r1, 189
LDI r2, 83
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 92
LDI r7, 39
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
