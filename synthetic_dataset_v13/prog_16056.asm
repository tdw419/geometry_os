; DESCRIPTION: Renders a cyan box of size 71x26 starting at (153, 103).
; PLAN: r0=153(x), r1=103(y), r2=71(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 103
LDI r2, 71
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
