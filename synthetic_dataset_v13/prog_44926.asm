; DESCRIPTION: Renders a cyan box of size 106x20 starting at (136, 55).
; PLAN: r0=136(x), r1=55(y), r2=106(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 55
LDI r2, 106
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
