; DESCRIPTION: Renders a cyan box of size 87x69 starting at (228, 183).
; PLAN: r0=228(x), r1=183(y), r2=87(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 183
LDI r2, 87
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
