; DESCRIPTION: Renders a cyan box of size 102x59 starting at (37, 124).
; PLAN: r0=37(x), r1=124(y), r2=102(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 124
LDI r2, 102
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
