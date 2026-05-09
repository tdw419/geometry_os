; DESCRIPTION: Renders a cyan box of size 28x58 starting at (113, 122).
; PLAN: r0=113(x), r1=122(y), r2=28(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 122
LDI r2, 28
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
