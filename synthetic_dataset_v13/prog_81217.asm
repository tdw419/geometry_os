; DESCRIPTION: Places a blue 47x60 rectangle at position (146, 0).
; PLAN: r0=146(x), r1=0(y), r2=47(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 0
LDI r2, 47
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
