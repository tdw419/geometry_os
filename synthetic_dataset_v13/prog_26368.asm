; DESCRIPTION: Renders a cyan box of size 77x58 starting at (413, 103).
; PLAN: r0=413(x), r1=103(y), r2=77(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 103
LDI r2, 77
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
