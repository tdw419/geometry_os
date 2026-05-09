; DESCRIPTION: Renders a orange box of size 42x73 starting at (446, 53).
; PLAN: r0=446(x), r1=53(y), r2=42(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 53
LDI r2, 42
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
