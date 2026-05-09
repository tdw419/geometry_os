; DESCRIPTION: Renders a cyan box of size 20x86 starting at (15, 0).
; PLAN: r0=15(x), r1=0(y), r2=20(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 0
LDI r2, 20
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
