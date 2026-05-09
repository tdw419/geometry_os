; DESCRIPTION: Renders a orange box of size 53x28 starting at (290, 146).
; PLAN: r0=290(x), r1=146(y), r2=53(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 146
LDI r2, 53
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
