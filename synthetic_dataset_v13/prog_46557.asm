; DESCRIPTION: Renders a cyan box of size 92x27 starting at (8, 118).
; PLAN: r0=8(x), r1=118(y), r2=92(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 118
LDI r2, 92
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
