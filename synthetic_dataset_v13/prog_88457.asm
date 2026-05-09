; DESCRIPTION: Renders a cyan box of size 62x75 starting at (56, 60).
; PLAN: r0=56(x), r1=60(y), r2=62(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 60
LDI r2, 62
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
