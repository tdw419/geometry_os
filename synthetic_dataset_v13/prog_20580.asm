; DESCRIPTION: Places a yellow 29x43 rectangle at position (178, 142).
; PLAN: r0=178(x), r1=142(y), r2=29(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 142
LDI r2, 29
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
