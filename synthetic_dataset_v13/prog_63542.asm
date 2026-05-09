; DESCRIPTION: Renders a orange box of size 29x48 starting at (66, 164).
; PLAN: r0=66(x), r1=164(y), r2=29(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 164
LDI r2, 29
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
