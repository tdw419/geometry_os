; DESCRIPTION: Renders a orange box of size 93x40 starting at (411, 152).
; PLAN: r0=411(x), r1=152(y), r2=93(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 152
LDI r2, 93
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
