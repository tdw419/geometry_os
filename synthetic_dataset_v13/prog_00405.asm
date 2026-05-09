; DESCRIPTION: Renders a cyan box of size 66x48 starting at (74, 130).
; PLAN: r0=74(x), r1=130(y), r2=66(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 130
LDI r2, 66
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
