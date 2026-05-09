; DESCRIPTION: Renders a orange box of size 24x12 starting at (57, 210).
; PLAN: r0=57(x), r1=210(y), r2=24(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 210
LDI r2, 24
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
