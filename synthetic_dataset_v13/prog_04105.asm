; DESCRIPTION: Places a black 16x43 rectangle at position (294, 0).
; PLAN: r0=294(x), r1=0(y), r2=16(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 0
LDI r2, 16
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
