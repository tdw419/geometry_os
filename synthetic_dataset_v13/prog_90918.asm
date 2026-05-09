; DESCRIPTION: Composite: Renders a orange box of size 35x69 starting at (412, 27) then Sets a single white pixel at (72, 214).
; PLAN: r0=412(x), r1=27(y), r2=35(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x), r6=214(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 412
LDI r1, 27
LDI r2, 35
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 214
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
