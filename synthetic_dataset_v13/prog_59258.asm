; DESCRIPTION: Renders a cyan box of size 60x61 starting at (329, 52).
; PLAN: r0=329(x), r1=52(y), r2=60(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 52
LDI r2, 60
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
