; DESCRIPTION: Renders a green box of size 33x61 starting at (93, 154).
; PLAN: r0=93(x), r1=154(y), r2=33(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 154
LDI r2, 33
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
