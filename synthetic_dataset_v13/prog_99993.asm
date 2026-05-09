; DESCRIPTION: Renders a cyan box of size 74x61 starting at (327, 9).
; PLAN: r0=327(x), r1=9(y), r2=74(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 9
LDI r2, 74
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
