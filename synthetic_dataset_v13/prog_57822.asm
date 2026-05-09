; DESCRIPTION: Renders a cyan box of size 86x31 starting at (63, 76).
; PLAN: r0=63(x), r1=76(y), r2=86(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 76
LDI r2, 86
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
