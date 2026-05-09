; DESCRIPTION: Renders a yellow box of size 28x94 starting at (224, 106).
; PLAN: r0=224(x), r1=106(y), r2=28(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 106
LDI r2, 28
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
