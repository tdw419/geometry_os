; DESCRIPTION: Renders a cyan box of size 101x38 starting at (49, 168).
; PLAN: r0=49(x), r1=168(y), r2=101(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 168
LDI r2, 101
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
