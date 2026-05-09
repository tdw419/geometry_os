; DESCRIPTION: Renders a black box of size 48x100 starting at (224, 35).
; PLAN: r0=224(x), r1=35(y), r2=48(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 35
LDI r2, 48
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
