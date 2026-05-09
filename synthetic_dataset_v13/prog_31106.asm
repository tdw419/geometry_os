; DESCRIPTION: Renders a cyan box of size 12x78 starting at (184, 154).
; PLAN: r0=184(x), r1=154(y), r2=12(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 154
LDI r2, 12
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
