; DESCRIPTION: Places a red 83x98 rectangle at position (125, 37).
; PLAN: r0=125(x), r1=37(y), r2=83(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 37
LDI r2, 83
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
