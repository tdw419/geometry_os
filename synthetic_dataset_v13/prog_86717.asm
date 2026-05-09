; DESCRIPTION: Renders a cyan box of size 80x102 starting at (408, 148).
; PLAN: r0=408(x), r1=148(y), r2=80(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 148
LDI r2, 80
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
