; DESCRIPTION: Renders a cyan box of size 76x42 starting at (406, 6).
; PLAN: r0=406(x), r1=6(y), r2=76(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 6
LDI r2, 76
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
