; DESCRIPTION: Renders a cyan box of size 55x42 starting at (78, 179).
; PLAN: r0=78(x), r1=179(y), r2=55(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 179
LDI r2, 55
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
