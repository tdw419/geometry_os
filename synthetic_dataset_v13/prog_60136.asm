; DESCRIPTION: Renders a green box of size 116x103 starting at (153, 98).
; PLAN: r0=153(x), r1=98(y), r2=116(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 98
LDI r2, 116
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
