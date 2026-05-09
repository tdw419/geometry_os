; DESCRIPTION: Renders a cyan box of size 74x72 starting at (285, 80).
; PLAN: r0=285(x), r1=80(y), r2=74(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 80
LDI r2, 74
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
