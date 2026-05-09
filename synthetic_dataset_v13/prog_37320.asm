; DESCRIPTION: Renders a cyan box of size 55x60 starting at (426, 42).
; PLAN: r0=426(x), r1=42(y), r2=55(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 42
LDI r2, 55
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
