; DESCRIPTION: Places a red 75x32 rectangle at position (143, 112).
; PLAN: r0=143(x), r1=112(y), r2=75(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 112
LDI r2, 75
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
