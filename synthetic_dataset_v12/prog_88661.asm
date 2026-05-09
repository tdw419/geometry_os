; DESCRIPTION: Renders a cyan box of size 73x92 starting at (426, 12).
; PLAN: r0=426(x), r1=12(y), r2=73(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 12
LDI r2, 73
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
