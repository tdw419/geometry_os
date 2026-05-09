; DESCRIPTION: Places a blue 11x16 rectangle at position (479, 57).
; PLAN: r0=479(x), r1=57(y), r2=11(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 57
LDI r2, 11
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
