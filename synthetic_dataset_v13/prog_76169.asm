; DESCRIPTION: Places a blue 113x18 rectangle at position (305, 57).
; PLAN: r0=305(x), r1=57(y), r2=113(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 57
LDI r2, 113
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
