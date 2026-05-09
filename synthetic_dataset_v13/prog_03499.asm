; DESCRIPTION: Renders a cyan box of size 112x57 starting at (349, 56).
; PLAN: r0=349(x), r1=56(y), r2=112(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 56
LDI r2, 112
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
