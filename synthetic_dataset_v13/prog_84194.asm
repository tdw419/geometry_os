; DESCRIPTION: Renders a cyan box of size 19x49 starting at (262, 61).
; PLAN: r0=262(x), r1=61(y), r2=19(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 61
LDI r2, 19
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
