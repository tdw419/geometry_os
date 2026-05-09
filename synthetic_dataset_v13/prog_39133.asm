; DESCRIPTION: Renders a orange box of size 37x32 starting at (211, 59).
; PLAN: r0=211(x), r1=59(y), r2=37(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 59
LDI r2, 37
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
