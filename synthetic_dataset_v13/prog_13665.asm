; DESCRIPTION: Renders a cyan box of size 86x18 starting at (296, 102).
; PLAN: r0=296(x), r1=102(y), r2=86(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 102
LDI r2, 86
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
