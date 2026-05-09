; DESCRIPTION: Renders a orange box of size 91x86 starting at (238, 103).
; PLAN: r0=238(x), r1=103(y), r2=91(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 103
LDI r2, 91
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
