; DESCRIPTION: Renders a cyan box of size 71x59 starting at (105, 171).
; PLAN: r0=105(x), r1=171(y), r2=71(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 171
LDI r2, 71
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
