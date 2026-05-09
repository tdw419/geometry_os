; DESCRIPTION: Renders a orange box of size 93x27 starting at (210, 68).
; PLAN: r0=210(x), r1=68(y), r2=93(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 68
LDI r2, 93
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
