; DESCRIPTION: Places a blue 18x71 rectangle at position (75, 167).
; PLAN: r0=75(x), r1=167(y), r2=18(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 167
LDI r2, 18
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
