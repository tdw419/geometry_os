; DESCRIPTION: Renders a white box of size 76x108 starting at (405, 37).
; PLAN: r0=405(x), r1=37(y), r2=76(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 37
LDI r2, 76
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
