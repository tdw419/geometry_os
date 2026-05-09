; DESCRIPTION: Renders a orange box of size 93x32 starting at (153, 109).
; PLAN: r0=153(x), r1=109(y), r2=93(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 109
LDI r2, 93
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
