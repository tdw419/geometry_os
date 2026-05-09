; DESCRIPTION: Renders a white box of size 73x47 starting at (239, 13).
; PLAN: r0=239(x), r1=13(y), r2=73(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 13
LDI r2, 73
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
