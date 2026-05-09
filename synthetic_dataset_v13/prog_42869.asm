; DESCRIPTION: Places a yellow 102x17 rectangle at position (1, 224).
; PLAN: r0=1(x), r1=224(y), r2=102(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 224
LDI r2, 102
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
