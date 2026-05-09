; DESCRIPTION: Renders a cyan box of size 23x43 starting at (184, 171).
; PLAN: r0=184(x), r1=171(y), r2=23(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 171
LDI r2, 23
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
