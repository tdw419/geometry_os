; DESCRIPTION: Renders a cyan box of size 37x103 starting at (170, 7).
; PLAN: r0=170(x), r1=7(y), r2=37(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 7
LDI r2, 37
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
