; DESCRIPTION: Renders a cyan box of size 39x93 starting at (3, 28).
; PLAN: r0=3(x), r1=28(y), r2=39(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 28
LDI r2, 39
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
