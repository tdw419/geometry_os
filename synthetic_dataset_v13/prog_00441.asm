; DESCRIPTION: Renders a cyan box of size 93x69 starting at (280, 18).
; PLAN: r0=280(x), r1=18(y), r2=93(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 18
LDI r2, 93
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
