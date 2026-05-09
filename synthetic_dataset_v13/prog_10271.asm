; DESCRIPTION: Renders a cyan box of size 84x92 starting at (372, 138).
; PLAN: r0=372(x), r1=138(y), r2=84(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 138
LDI r2, 84
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
