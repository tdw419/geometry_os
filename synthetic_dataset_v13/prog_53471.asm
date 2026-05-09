; DESCRIPTION: Places a red 47x77 rectangle at position (230, 18).
; PLAN: r0=230(x), r1=18(y), r2=47(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 18
LDI r2, 47
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
