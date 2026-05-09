; DESCRIPTION: Renders a cyan box of size 69x83 starting at (290, 116).
; PLAN: r0=290(x), r1=116(y), r2=69(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 116
LDI r2, 69
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
