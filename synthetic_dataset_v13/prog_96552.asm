; DESCRIPTION: Renders a cyan box of size 42x89 starting at (454, 40).
; PLAN: r0=454(x), r1=40(y), r2=42(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 40
LDI r2, 42
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
