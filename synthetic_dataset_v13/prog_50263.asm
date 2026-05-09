; DESCRIPTION: Renders a cyan box of size 25x39 starting at (421, 96).
; PLAN: r0=421(x), r1=96(y), r2=25(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 96
LDI r2, 25
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
