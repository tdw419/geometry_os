; DESCRIPTION: Renders a cyan box of size 30x78 starting at (358, 125).
; PLAN: r0=358(x), r1=125(y), r2=30(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 125
LDI r2, 30
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
