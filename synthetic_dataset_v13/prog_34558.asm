; DESCRIPTION: Places a blue 24x60 rectangle at position (285, 171).
; PLAN: r0=285(x), r1=171(y), r2=24(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 171
LDI r2, 24
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
