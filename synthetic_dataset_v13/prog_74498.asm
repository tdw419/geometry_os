; DESCRIPTION: Renders a orange box of size 90x115 starting at (58, 96).
; PLAN: r0=58(x), r1=96(y), r2=90(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 96
LDI r2, 90
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
