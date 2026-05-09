; DESCRIPTION: Renders a green box of size 77x34 starting at (224, 142).
; PLAN: r0=224(x), r1=142(y), r2=77(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 142
LDI r2, 77
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
