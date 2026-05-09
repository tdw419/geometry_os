; DESCRIPTION: Places a white 111x42 rectangle at position (230, 51).
; PLAN: r0=230(x), r1=51(y), r2=111(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 51
LDI r2, 111
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
