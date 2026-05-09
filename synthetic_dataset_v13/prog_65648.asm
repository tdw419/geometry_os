; DESCRIPTION: Places a red 97x51 rectangle at position (392, 83).
; PLAN: r0=392(x), r1=83(y), r2=97(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 83
LDI r2, 97
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
