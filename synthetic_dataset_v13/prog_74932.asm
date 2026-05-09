; DESCRIPTION: Renders a orange box of size 61x25 starting at (309, 192).
; PLAN: r0=309(x), r1=192(y), r2=61(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 192
LDI r2, 61
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
