; DESCRIPTION: Renders a cyan box of size 87x76 starting at (232, 4).
; PLAN: r0=232(x), r1=4(y), r2=87(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 4
LDI r2, 87
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
