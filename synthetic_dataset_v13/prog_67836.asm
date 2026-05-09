; DESCRIPTION: Places a black 83x61 rectangle at position (135, 180).
; PLAN: r0=135(x), r1=180(y), r2=83(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 180
LDI r2, 83
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
