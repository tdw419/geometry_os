; DESCRIPTION: Renders a orange box of size 57x107 starting at (346, 129).
; PLAN: r0=346(x), r1=129(y), r2=57(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 129
LDI r2, 57
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
