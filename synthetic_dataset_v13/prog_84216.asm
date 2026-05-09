; DESCRIPTION: Renders a orange box of size 93x57 starting at (275, 126).
; PLAN: r0=275(x), r1=126(y), r2=93(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 126
LDI r2, 93
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
