; DESCRIPTION: Renders a cyan box of size 120x107 starting at (232, 19).
; PLAN: r0=232(x), r1=19(y), r2=120(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 19
LDI r2, 120
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
