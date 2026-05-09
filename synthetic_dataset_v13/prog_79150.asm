; DESCRIPTION: Renders a cyan box of size 78x50 starting at (35, 122).
; PLAN: r0=35(x), r1=122(y), r2=78(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 122
LDI r2, 78
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
