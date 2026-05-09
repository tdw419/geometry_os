; DESCRIPTION: Renders a cyan box of size 102x92 starting at (286, 136).
; PLAN: r0=286(x), r1=136(y), r2=102(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 136
LDI r2, 102
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
