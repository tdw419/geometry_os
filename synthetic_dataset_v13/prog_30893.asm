; DESCRIPTION: Places a blue 83x23 rectangle at position (24, 146).
; PLAN: r0=24(x), r1=146(y), r2=83(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 146
LDI r2, 83
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
