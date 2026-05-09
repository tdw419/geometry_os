; DESCRIPTION: Places a blue 36x61 rectangle at position (171, 112).
; PLAN: r0=171(x), r1=112(y), r2=36(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 112
LDI r2, 36
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
