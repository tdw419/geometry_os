; DESCRIPTION: Renders a cyan box of size 59x49 starting at (438, 36).
; PLAN: r0=438(x), r1=36(y), r2=59(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 36
LDI r2, 59
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
