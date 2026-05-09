; DESCRIPTION: Places a blue 113x20 rectangle at position (302, 165).
; PLAN: r0=302(x), r1=165(y), r2=113(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 165
LDI r2, 113
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
