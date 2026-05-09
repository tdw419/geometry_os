; DESCRIPTION: Renders a orange box of size 16x10 starting at (346, 161).
; PLAN: r0=346(x), r1=161(y), r2=16(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 161
LDI r2, 16
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
