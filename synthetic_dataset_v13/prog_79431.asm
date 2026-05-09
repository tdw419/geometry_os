; DESCRIPTION: Places a cyan 109x112 rectangle at position (215, 72).
; PLAN: r0=215(x), r1=72(y), r2=109(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 72
LDI r2, 109
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
