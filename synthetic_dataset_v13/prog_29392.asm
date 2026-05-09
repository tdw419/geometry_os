; DESCRIPTION: Renders a orange box of size 60x28 starting at (239, 50).
; PLAN: r0=239(x), r1=50(y), r2=60(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 50
LDI r2, 60
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
