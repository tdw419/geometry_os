; DESCRIPTION: Renders a cyan box of size 94x67 starting at (26, 26).
; PLAN: r0=26(x), r1=26(y), r2=94(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 26
LDI r2, 94
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
