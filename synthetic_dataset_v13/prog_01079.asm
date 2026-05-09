; DESCRIPTION: Places a blue 111x47 rectangle at position (258, 16).
; PLAN: r0=258(x), r1=16(y), r2=111(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 16
LDI r2, 111
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
