; DESCRIPTION: Renders a cyan box of size 105x107 starting at (191, 120).
; PLAN: r0=191(x), r1=120(y), r2=105(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 120
LDI r2, 105
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
