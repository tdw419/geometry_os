; DESCRIPTION: Places a red 43x97 rectangle at position (269, 142).
; PLAN: r0=269(x), r1=142(y), r2=43(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 142
LDI r2, 43
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
