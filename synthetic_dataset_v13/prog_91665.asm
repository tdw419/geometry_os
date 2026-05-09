; DESCRIPTION: Renders a cyan box of size 14x86 starting at (101, 8).
; PLAN: r0=101(x), r1=8(y), r2=14(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 8
LDI r2, 14
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
