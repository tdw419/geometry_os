; DESCRIPTION: Creates a yellow rectangular region at (442, 18) spanning 45 by 10 pixels.
; PLAN: r0=442(x), r1=18(y), r2=45(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 18
LDI r2, 45
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
