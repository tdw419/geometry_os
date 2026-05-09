; DESCRIPTION: Renders a white box of size 55x58 starting at (264, 198).
; PLAN: r0=264(x), r1=198(y), r2=55(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 198
LDI r2, 55
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
