; DESCRIPTION: Places a blue 66x90 rectangle at position (305, 120).
; PLAN: r0=305(x), r1=120(y), r2=66(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 120
LDI r2, 66
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
