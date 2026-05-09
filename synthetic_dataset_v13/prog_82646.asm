; DESCRIPTION: Renders a cyan box of size 50x115 starting at (102, 88).
; PLAN: r0=102(x), r1=88(y), r2=50(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 88
LDI r2, 50
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
