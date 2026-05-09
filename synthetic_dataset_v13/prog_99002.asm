; DESCRIPTION: Places a red 105x57 rectangle at position (192, 46).
; PLAN: r0=192(x), r1=46(y), r2=105(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 46
LDI r2, 105
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
