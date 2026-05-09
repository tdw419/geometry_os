; DESCRIPTION: Renders a black box of size 27x93 starting at (445, 0).
; PLAN: r0=445(x), r1=0(y), r2=27(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 0
LDI r2, 27
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
