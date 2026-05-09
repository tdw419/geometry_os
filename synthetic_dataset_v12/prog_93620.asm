; DESCRIPTION: Renders a cyan box of size 115x54 starting at (309, 154).
; PLAN: r0=309(x), r1=154(y), r2=115(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 154
LDI r2, 115
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
