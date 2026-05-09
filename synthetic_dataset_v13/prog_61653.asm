; DESCRIPTION: Renders a cyan box of size 76x110 starting at (361, 42).
; PLAN: r0=361(x), r1=42(y), r2=76(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 42
LDI r2, 76
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
