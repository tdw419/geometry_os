; DESCRIPTION: Renders a yellow box of size 115x17 starting at (224, 16).
; PLAN: r0=224(x), r1=16(y), r2=115(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 16
LDI r2, 115
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
