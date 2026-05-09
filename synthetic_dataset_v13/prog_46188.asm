; DESCRIPTION: Renders a orange box of size 45x87 starting at (295, 138).
; PLAN: r0=295(x), r1=138(y), r2=45(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 138
LDI r2, 45
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
