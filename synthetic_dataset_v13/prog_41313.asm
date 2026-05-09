; DESCRIPTION: Places a purple 30x77 rectangle at position (445, 141).
; PLAN: r0=445(x), r1=141(y), r2=30(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 141
LDI r2, 30
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
