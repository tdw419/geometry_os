; DESCRIPTION: Renders a orange box of size 93x30 starting at (224, 125).
; PLAN: r0=224(x), r1=125(y), r2=93(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 125
LDI r2, 93
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
