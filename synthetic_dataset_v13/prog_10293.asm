; DESCRIPTION: Renders a cyan box of size 27x69 starting at (111, 20).
; PLAN: r0=111(x), r1=20(y), r2=27(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 20
LDI r2, 27
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
