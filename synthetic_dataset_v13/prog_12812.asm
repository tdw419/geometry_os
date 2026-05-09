; DESCRIPTION: Renders a cyan box of size 35x55 starting at (105, 166).
; PLAN: r0=105(x), r1=166(y), r2=35(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 166
LDI r2, 35
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
