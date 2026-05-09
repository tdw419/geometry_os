; DESCRIPTION: Places a black 87x95 rectangle at position (228, 125).
; PLAN: r0=228(x), r1=125(y), r2=87(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 125
LDI r2, 87
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
