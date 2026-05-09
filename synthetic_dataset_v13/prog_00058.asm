; DESCRIPTION: Places a red 77x91 rectangle at position (219, 29).
; PLAN: r0=219(x), r1=29(y), r2=77(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 29
LDI r2, 77
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
