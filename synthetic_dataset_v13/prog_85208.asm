; DESCRIPTION: Renders a cyan box of size 49x26 starting at (25, 152).
; PLAN: r0=25(x), r1=152(y), r2=49(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 152
LDI r2, 49
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
