; DESCRIPTION: Places a green 51x62 rectangle at position (167, 28).
; PLAN: r0=167(x), r1=28(y), r2=51(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 28
LDI r2, 51
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
