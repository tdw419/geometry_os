; DESCRIPTION: Renders a cyan box of size 55x11 starting at (25, 129).
; PLAN: r0=25(x), r1=129(y), r2=55(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 129
LDI r2, 55
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
