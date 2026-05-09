; DESCRIPTION: Renders a cyan box of size 24x67 starting at (270, 141).
; PLAN: r0=270(x), r1=141(y), r2=24(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 141
LDI r2, 24
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
