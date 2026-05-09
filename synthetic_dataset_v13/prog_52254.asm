; DESCRIPTION: Renders a cyan box of size 72x103 starting at (66, 88).
; PLAN: r0=66(x), r1=88(y), r2=72(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 88
LDI r2, 72
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
