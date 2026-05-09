; DESCRIPTION: Renders a green box of size 19x44 starting at (224, 19).
; PLAN: r0=224(x), r1=19(y), r2=19(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 19
LDI r2, 19
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
