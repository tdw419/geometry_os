; DESCRIPTION: Renders a cyan box of size 56x49 starting at (184, 42).
; PLAN: r0=184(x), r1=42(y), r2=56(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 42
LDI r2, 56
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
