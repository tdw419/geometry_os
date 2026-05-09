; DESCRIPTION: Creates a green rectangular region at (310, 154) spanning 65 by 42 pixels.
; PLAN: r0=310(x), r1=154(y), r2=65(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 154
LDI r2, 65
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
