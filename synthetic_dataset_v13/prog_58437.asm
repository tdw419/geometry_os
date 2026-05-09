; DESCRIPTION: Places a yellow 32x76 rectangle at position (292, 167).
; PLAN: r0=292(x), r1=167(y), r2=32(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 167
LDI r2, 32
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
