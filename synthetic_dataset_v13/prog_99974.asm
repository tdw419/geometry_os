; DESCRIPTION: Renders a cyan box of size 73x55 starting at (130, 42).
; PLAN: r0=130(x), r1=42(y), r2=73(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 42
LDI r2, 73
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
