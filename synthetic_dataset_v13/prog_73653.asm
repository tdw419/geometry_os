; DESCRIPTION: Places a blue 19x71 rectangle at position (243, 120).
; PLAN: r0=243(x), r1=120(y), r2=19(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 120
LDI r2, 19
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
