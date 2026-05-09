; DESCRIPTION: Renders a cyan box of size 42x14 starting at (32, 25).
; PLAN: r0=32(x), r1=25(y), r2=42(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 25
LDI r2, 42
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
