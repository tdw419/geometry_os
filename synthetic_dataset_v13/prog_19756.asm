; DESCRIPTION: Renders a cyan box of size 10x111 starting at (111, 68).
; PLAN: r0=111(x), r1=68(y), r2=10(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 68
LDI r2, 10
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
