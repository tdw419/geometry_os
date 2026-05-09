; DESCRIPTION: Places a purple 71x42 rectangle at position (51, 177).
; PLAN: r0=51(x), r1=177(y), r2=71(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 177
LDI r2, 71
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
