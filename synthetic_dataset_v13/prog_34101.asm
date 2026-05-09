; DESCRIPTION: Renders a orange box of size 21x115 starting at (239, 141).
; PLAN: r0=239(x), r1=141(y), r2=21(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 141
LDI r2, 21
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
