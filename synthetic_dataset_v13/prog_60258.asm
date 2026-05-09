; DESCRIPTION: Renders a cyan box of size 49x31 starting at (211, 60).
; PLAN: r0=211(x), r1=60(y), r2=49(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 60
LDI r2, 49
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
