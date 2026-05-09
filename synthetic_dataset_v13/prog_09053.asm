; DESCRIPTION: Places a red 44x25 rectangle at position (426, 49).
; PLAN: r0=426(x), r1=49(y), r2=44(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 49
LDI r2, 44
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
