; DESCRIPTION: Renders a cyan box of size 84x39 starting at (11, 134).
; PLAN: r0=11(x), r1=134(y), r2=84(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 134
LDI r2, 84
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
