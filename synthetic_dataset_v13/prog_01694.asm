; DESCRIPTION: Places a cyan 62x112 rectangle at position (215, 55).
; PLAN: r0=215(x), r1=55(y), r2=62(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 55
LDI r2, 62
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
