; DESCRIPTION: Renders a cyan box of size 15x65 starting at (56, 15).
; PLAN: r0=56(x), r1=15(y), r2=15(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 15
LDI r2, 15
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
