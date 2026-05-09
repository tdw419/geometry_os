; DESCRIPTION: Renders a cyan box of size 42x26 starting at (38, 33).
; PLAN: r0=38(x), r1=33(y), r2=42(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 33
LDI r2, 42
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
