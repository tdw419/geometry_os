; DESCRIPTION: Places a black 96x105 rectangle at position (308, 95).
; PLAN: r0=308(x), r1=95(y), r2=96(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 95
LDI r2, 96
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
