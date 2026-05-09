; DESCRIPTION: Renders a cyan box of size 78x81 starting at (120, 29).
; PLAN: r0=120(x), r1=29(y), r2=78(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 29
LDI r2, 78
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
