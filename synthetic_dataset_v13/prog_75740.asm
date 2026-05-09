; DESCRIPTION: Renders a orange box of size 92x25 starting at (346, 24).
; PLAN: r0=346(x), r1=24(y), r2=92(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 24
LDI r2, 92
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
