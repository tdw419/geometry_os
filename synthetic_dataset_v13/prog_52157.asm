; DESCRIPTION: Renders a orange box of size 50x25 starting at (376, 228).
; PLAN: r0=376(x), r1=228(y), r2=50(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 228
LDI r2, 50
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
