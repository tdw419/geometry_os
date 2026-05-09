; DESCRIPTION: Renders a cyan box of size 57x11 starting at (354, 112).
; PLAN: r0=354(x), r1=112(y), r2=57(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 112
LDI r2, 57
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
