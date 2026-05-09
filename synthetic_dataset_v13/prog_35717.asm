; DESCRIPTION: Renders a orange box of size 120x83 starting at (143, 32).
; PLAN: r0=143(x), r1=32(y), r2=120(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 32
LDI r2, 120
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
