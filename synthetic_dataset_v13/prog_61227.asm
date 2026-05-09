; DESCRIPTION: Renders a black box of size 87x103 starting at (187, 59).
; PLAN: r0=187(x), r1=59(y), r2=87(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 59
LDI r2, 87
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
