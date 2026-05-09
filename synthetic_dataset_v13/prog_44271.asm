; DESCRIPTION: Renders a orange box of size 92x74 starting at (350, 55).
; PLAN: r0=350(x), r1=55(y), r2=92(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 55
LDI r2, 92
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
