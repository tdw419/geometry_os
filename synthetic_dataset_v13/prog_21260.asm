; DESCRIPTION: Renders a cyan box of size 49x36 starting at (308, 18).
; PLAN: r0=308(x), r1=18(y), r2=49(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 18
LDI r2, 49
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
