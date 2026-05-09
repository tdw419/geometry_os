; DESCRIPTION: Places a red 105x18 rectangle at position (240, 83).
; PLAN: r0=240(x), r1=83(y), r2=105(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 83
LDI r2, 105
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
