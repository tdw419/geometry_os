; DESCRIPTION: Renders a cyan box of size 67x26 starting at (228, 194).
; PLAN: r0=228(x), r1=194(y), r2=67(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 194
LDI r2, 67
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
