; DESCRIPTION: Places a blue 113x112 rectangle at position (172, 4).
; PLAN: r0=172(x), r1=4(y), r2=113(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 4
LDI r2, 113
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
