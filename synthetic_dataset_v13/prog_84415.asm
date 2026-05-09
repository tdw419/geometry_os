; DESCRIPTION: Renders a cyan box of size 12x61 starting at (412, 140).
; PLAN: r0=412(x), r1=140(y), r2=12(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 140
LDI r2, 12
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
