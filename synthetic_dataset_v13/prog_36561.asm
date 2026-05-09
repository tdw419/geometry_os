; DESCRIPTION: Composite: Renders a orange box of size 120x33 starting at (169, 123) then Sets a single white pixel at (371, 108).
; PLAN: r0=169(x), r1=123(y), r2=120(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x), r6=108(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 169
LDI r1, 123
LDI r2, 120
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 108
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
