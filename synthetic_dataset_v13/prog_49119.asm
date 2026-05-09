; DESCRIPTION: Renders a orange box of size 50x62 starting at (263, 124).
; PLAN: r0=263(x), r1=124(y), r2=50(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 124
LDI r2, 50
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
