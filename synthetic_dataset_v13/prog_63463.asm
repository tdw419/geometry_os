; DESCRIPTION: Renders a cyan box of size 94x100 starting at (368, 102).
; PLAN: r0=368(x), r1=102(y), r2=94(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 102
LDI r2, 94
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
