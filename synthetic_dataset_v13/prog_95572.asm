; DESCRIPTION: Renders a cyan box of size 81x55 starting at (310, 75).
; PLAN: r0=310(x), r1=75(y), r2=81(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 75
LDI r2, 81
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
