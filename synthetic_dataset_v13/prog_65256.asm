; DESCRIPTION: Renders a cyan box of size 81x50 starting at (419, 183).
; PLAN: r0=419(x), r1=183(y), r2=81(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 183
LDI r2, 81
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
