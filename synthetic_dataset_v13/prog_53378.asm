; DESCRIPTION: Renders a cyan box of size 85x30 starting at (289, 52).
; PLAN: r0=289(x), r1=52(y), r2=85(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 52
LDI r2, 85
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
