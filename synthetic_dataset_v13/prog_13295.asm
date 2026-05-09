; DESCRIPTION: Renders a orange box of size 107x24 starting at (42, 196).
; PLAN: r0=42(x), r1=196(y), r2=107(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 196
LDI r2, 107
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
