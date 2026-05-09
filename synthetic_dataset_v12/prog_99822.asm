; DESCRIPTION: Renders a orange box of size 18x57 starting at (39, 164).
; PLAN: r0=39(x), r1=164(y), r2=18(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 164
LDI r2, 18
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
