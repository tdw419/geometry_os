; DESCRIPTION: Places a purple 120x61 rectangle at position (343, 174).
; PLAN: r0=343(x), r1=174(y), r2=120(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 174
LDI r2, 120
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
