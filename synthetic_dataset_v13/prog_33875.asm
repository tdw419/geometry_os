; DESCRIPTION: Renders a cyan box of size 36x61 starting at (164, 72).
; PLAN: r0=164(x), r1=72(y), r2=36(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 72
LDI r2, 36
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
