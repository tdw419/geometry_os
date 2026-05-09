; DESCRIPTION: Renders a cyan box of size 108x48 starting at (287, 72).
; PLAN: r0=287(x), r1=72(y), r2=108(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 72
LDI r2, 108
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
