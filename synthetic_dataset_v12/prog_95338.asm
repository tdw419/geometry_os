; DESCRIPTION: Composite: Places a orange circle of radius 27 at center (151, 61) then Renders a orange box of size 10x112 starting at (336, 8).
; PLAN: r0=151(x), r1=61(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=336(x), r6=8(y), r7=10(width), r8=112(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 61
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 336
LDI r6, 8
LDI r7, 10
LDI r8, 112
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
