; DESCRIPTION: Creates a white rectangular region at (224, 59) spanning 112 by 48 pixels.
; PLAN: r0=224(x), r1=59(y), r2=112(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 59
LDI r2, 112
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
