; DESCRIPTION: Places a cyan 79x36 rectangle at position (53, 112).
; PLAN: r0=53(x), r1=112(y), r2=79(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 112
LDI r2, 79
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
