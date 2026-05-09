; DESCRIPTION: Renders a yellow box of size 17x27 starting at (224, 84).
; PLAN: r0=224(x), r1=84(y), r2=17(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 84
LDI r2, 17
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
