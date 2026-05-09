; DESCRIPTION: Places a blue 46x107 rectangle at position (87, 48).
; PLAN: r0=87(x), r1=48(y), r2=46(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 48
LDI r2, 46
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
