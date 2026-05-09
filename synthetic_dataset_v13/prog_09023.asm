; DESCRIPTION: Places a blue 65x41 rectangle at position (294, 183).
; PLAN: r0=294(x), r1=183(y), r2=65(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 183
LDI r2, 65
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
