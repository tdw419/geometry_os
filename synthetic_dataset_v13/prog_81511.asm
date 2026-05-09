; DESCRIPTION: Renders a cyan box of size 20x75 starting at (189, 22).
; PLAN: r0=189(x), r1=22(y), r2=20(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 22
LDI r2, 20
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
