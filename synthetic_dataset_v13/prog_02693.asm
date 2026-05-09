; DESCRIPTION: Places a white 49x99 rectangle at position (224, 39).
; PLAN: r0=224(x), r1=39(y), r2=49(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 39
LDI r2, 49
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
