; DESCRIPTION: Creates a yellow rectangular region at (354, 154) spanning 64 by 91 pixels.
; PLAN: r0=354(x), r1=154(y), r2=64(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 154
LDI r2, 64
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
