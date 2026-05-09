; DESCRIPTION: Places a yellow 105x106 rectangle at position (372, 113).
; PLAN: r0=372(x), r1=113(y), r2=105(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 113
LDI r2, 105
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
