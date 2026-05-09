; DESCRIPTION: Renders a cyan box of size 105x44 starting at (228, 155).
; PLAN: r0=228(x), r1=155(y), r2=105(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 155
LDI r2, 105
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
