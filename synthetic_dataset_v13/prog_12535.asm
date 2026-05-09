; DESCRIPTION: Renders a white box of size 45x86 starting at (45, 108).
; PLAN: r0=45(x), r1=108(y), r2=45(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 108
LDI r2, 45
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
