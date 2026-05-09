; DESCRIPTION: Renders a magenta box of size 87x26 starting at (215, 187).
; PLAN: r0=215(x), r1=187(y), r2=87(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 187
LDI r2, 87
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
