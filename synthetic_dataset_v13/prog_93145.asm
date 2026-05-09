; DESCRIPTION: Renders a cyan box of size 69x18 starting at (363, 105).
; PLAN: r0=363(x), r1=105(y), r2=69(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 105
LDI r2, 69
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
