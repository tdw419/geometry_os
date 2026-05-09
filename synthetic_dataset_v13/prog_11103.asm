; DESCRIPTION: Renders a cyan box of size 102x36 starting at (200, 27).
; PLAN: r0=200(x), r1=27(y), r2=102(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 27
LDI r2, 102
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
