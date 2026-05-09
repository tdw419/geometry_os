; DESCRIPTION: Creates a green rectangular region at (154, 198) spanning 17 by 27 pixels.
; PLAN: r0=154(x), r1=198(y), r2=17(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 198
LDI r2, 17
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
