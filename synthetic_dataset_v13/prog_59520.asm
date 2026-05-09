; DESCRIPTION: Renders a cyan box of size 69x102 starting at (418, 54).
; PLAN: r0=418(x), r1=54(y), r2=69(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 54
LDI r2, 69
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
