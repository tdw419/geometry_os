; DESCRIPTION: Renders a orange box of size 42x66 starting at (13, 177).
; PLAN: r0=13(x), r1=177(y), r2=42(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 177
LDI r2, 42
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
