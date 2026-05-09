; DESCRIPTION: Renders a cyan box of size 26x69 starting at (346, 181).
; PLAN: r0=346(x), r1=181(y), r2=26(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 181
LDI r2, 26
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
